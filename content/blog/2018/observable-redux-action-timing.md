---
  title: "Timing of reducing Actions with Redux Observable"
  date: 2018-01-18
  author: Brian Leathem
  categories: [Javascript ]
  tags: [ Javascript, React, Redux, Observable ]
  type: post
---

In this post I will describe the flow of actions through a [Redux](https://redux.js.org/) application configured with [redux-observable](https://redux-observable.js.org/) middleware.

In a Redux application, actions are dispatched and reduced synchronously, which makes it relatively straightforward to follow.  However with redux-observable epics, we can introduces asynchronicity into the action flow when actions are dispatched as a result of asynchronous events.

In this post we will look at what happens when a redux-observable epic emits a sequence of actions (`[1,2,3]`), and those actions in turn trigger epics that emit more actions (eg. `2` triggers `2a`).  In what order is the resulting chain of actions reduced?  Is action `3` reduced before or after `2a`?

Understanding which reducers have been executed is important to understand what  state your epics will receive.  If an action has not been reduced, any state updated by that reducer will not yet be available to subsequent epics.

## Action flow with Redux

Before answering this super-detailed question, let's review the flow of a dispatched action in a redux application using the diagram below:

{{< figure src="/img/blog/2018/observable-redux-action-timing__redux-diagram.png" title="Redux Action Flow" >}}

In a typical React/Redux application, the flow looks like:

1. A component dispatches an action
2. The action is reduced, and the state in the store is updated
3. The UI receives the updated state

When we introduce the redux-observable middleware, we observe the stream of actions and dispatch new actions: "action in, action out".  These new actions are in turn reduced and the store updated, in the same manner as actions dispatched from components.  The redux-observable term for this pattern is an _epic_.  The epic pattern extends the action flow in the above diagram with the steps shaded in gray:

<ol start="4">
<li>The epic observes the action and the updated state
<li>The epic dispatched one or more new actions
</ol>

The canonical use case for an epic is to fetch data asynchronously.  For example, the epic can:

- Observe FETCH_USER actions
- Initiate the asynchronous data retrieval
- Then dispatch a FETCH_USER_FULFILLED action with the returned data.

Such an epic might look like:

```js
import { ajax } from 'rxjs/observable/dom/ajax';

// action creators
const fetchUser = username => ({ type: FETCH_USER, payload: username });
const fetchUserFulfilled = payload => ({ type: FETCH_USER_FULFILLED, payload });

// epic
const fetchUserEpic = action$ =>
  action$.ofType(FETCH_USER)
    .mergeMap(action => ajax.getJSON(`https://api.github.com/users/${action.payload}`))
    .map(response => fetchUserFulfilled(response));
```

This is all well documented in the [redux-middleware](https://redux.js.org/docs/advanced/Middleware.html) and [redux-observable](https://redux-observable.js.org/docs/basics/Epics.html) docs, from where I grabbed the above code snippet.

## Dispatching multiple actions

Sometimes you want to dispatch multiple actions from an epic.  For instance what if you want to both update the UI with the returned data, and trigger a subsequent async data retrieval.  In this scenario we can change the epic to return an Observable of actions rather than a single action, as in:

```js
const fetchUserEpic = action$ =>
  action$.ofType(FETCH_USER)
    .mergeMap(action => ajax.getJSON(`https://api.github.com/users/${action.payload}`))
    .mergeMap(response => [
       fetchUserFulfilled(response),  // update the store with the returned data
       fetchAdditionalUserData() // An action to fetch the accounts of a user
    );
```

In working with the above pattern, I came to a point where I wanted to know the order in which such a sequence of actions was reduced.  Consider the following scenario:

1. Dispatch an action `ACTION_1`
2. Reduce `ACTION_1`
3. Trigger an epic
4. Dispatch an array of actions from the epic [ `ACTION_2`, `ACTION_3` ]
5. Invoke the reducer for `ACTION_2`
6. Trigger an epic for `ACTION_2`
7. Dispatch a new action `ACTION_2a` from this epic
8. Reduce an action, but which action will be reduced next: `ACTION_2b` or `ACTION_3` ???

There are two possible scenarios:

**Scenario 1**: the action dispatched from the epic observing `ACTION_2` is reduced first: `ACTION_2a` is reduced before `ACTION_3`.

**Scenario 2**: the action dispatched with `ACTION_2` is reduced first: `ACTION_3` will be reduced before `ACTION_2a`.


It turns out that both of these scenarios are correct!  The difference comes down to whether or not the observing epic introduces asynchronous behaviour.

This is demonstrated in the following code sample, where we have both an async and sync epics triggered from the actions dispatched by our initial epic.

```js
import { createStore, applyMiddleware, compose, combineReducers } from 'redux';
import { createEpicMiddleware, combineEpics } from 'redux-observable';
import { Observable, Scheduler } from 'rxjs';

const makeActionCreator = (type, ...argNames) => {
    return function (...args) {
        // console.log('Creating action', type, args[0]);
        const action = { type };
        argNames.forEach((arg, index) => {
            action[argNames[index]] = args[index];
        });
        return action;
    };
}

enum Actions {
    ACTION_1 = 'ACTION_1',
    ACTION_2 = 'ACTION_2',
    ACTION_3 = 'ACTION_3',
    ACTION_2A = 'ACTION_2a',
    ACTION_3A = 'ACTION_3a'
}

const dispatchAction1 = makeActionCreator(Actions.ACTION_1, "value");
const dispatchAction2 = makeActionCreator(Actions.ACTION_2, "value");
const dispatchAction3 = makeActionCreator(Actions.ACTION_3, "value");
const dispatchAction2a = makeActionCreator(Actions.ACTION_2A, "value");
const dispatchAction3a = makeActionCreator(Actions.ACTION_3A, "value");

const testReducer = (state = {}, action) => {

    switch (action.type) {
        case Actions.ACTION_1:
            console.log('Reducing action 1');
            return {
                ...state,
                value1: action.value
            }
        case Actions.ACTION_2:
            console.log('Reducing action 2');
            return {
                ...state,
                value2: action.value
            }
        case Actions.ACTION_3:
            console.log('Reducing action 3');
            return {
                ...state,
                value3: action.value
            }
        case Actions.ACTION_2A:
            console.log('Reducing action 2a');
            return {
                ...state,
                value2a: action.value
            }
        case Actions.ACTION_3A:
            console.log('Reducing action 3a');
            return {
                ...state,
                value3a: action.value
            }
    }
    return state;
}

const action1Epic = (action$, store) =>
    action$.ofType(Actions.ACTION_1)
    .mergeMap(action => [
        dispatchAction2("From 1"),
        dispatchAction3("From 1")
    ]);

const asyncEpic2 = (action$, store) =>
    action$.ofType(Actions.ACTION_2)
    .mapTo('async task from asyncEpic2')
    // Comment out this line to make this epic synchronous
    .observeOn(Scheduler.async)
    .do(msg => console.log(msg))
    .mapTo(dispatchAction2a("From 2"));

const syncEpic3 = (action$, store) =>
    action$.ofType(Actions.ACTION_3)
    .mergeMap(action =>
        Observable.of('sync task from syncEpic3')
    )
    .do(msg => console.log(msg))
    .mapTo(dispatchAction3a("From 3"));

const testEpics = combineEpics(action1Epic, asyncEpic2, syncEpic3);

const epicMiddleware = createEpicMiddleware(testEpics);
const testStore = createStore(
    testReducer,
    applyMiddleware(epicMiddleware)
);

// Dispatch the first action
testStore.dispatch(dispatchAction1("From the top."));
```

_Note: If you want to play with the above code yourself, you can comment out the `observeOn(Scheduler.async)` line to make make that epic synchronous._

On running this code snippet we can inspect the console log to see the order in which the actions were dispatched and reduced:

```none
Reducing action 1
Reducing action 2
Reducing action 3
sync task from syncEpic3
Reducing action 3a
Waiting for update signal from WDS...
async task from asyncEpic2
Reducing action 2a
```

## Conclusion

From this output we can see both `ACTION_3` and `ACTION_3a` are reduced before `ACTION_2a`.  We can conclude that:

_Scenario 1_ is correct when you're epic is synchronous, and _Scenario 2_ is correct for asynchronous epics.  This is more succinctly restated as:

> Actions dispatched from synchronous epics will be reduced synchronously; redux-observable does not in and of itself introduce asynchronicity into your application.

Understanding what's happening here is by no means necessary to incorporate redux-observable in your application, but hopefully my documentation of this behavior proves useful to someone.  If so, please let me know in the comments!
