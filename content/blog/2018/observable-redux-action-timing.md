---
  title: "Timing of reducing Actions with Redux Observable"
  date: 2018-01-18
  author: Brian Leathem
  categories: [Javascript ]
  tags: [ Javascript, React, Redux, Observable ]
  type: post
---

In this post I will describe the flow of actions through a [Redux](https://redux.js.org/) application configured with [redux-observable](https://redux-observable.js.org/) middleware.  Specifically, what happens when a redux-observable epic emits a sequence of actions, and those actions in turn trigger epics that emit more actions.  In what order is the resulting chain of actions reduced?

## Action flow with Redux

Before answering this super-detailed question, let's review the flow of a dispatched action in a redux application using the diagram below:

{{< figure src="/img/blog/2018/observable-redux-action-timing__redux-diagram.png" title="Redux Action Flow" >}}

In a typical React/Redux application, the flow looks like:

1. A component dispatches an action
2. The action is reduced, and the state in the store is updated
3. The UI receives the updated state

When we introduce the redux-observable middleware, we can observe the stream of actions and dispatch new actions: action in, actiopn out.  These new actions are in turn reduced and the store updated, in the same manner as actions dispatched from components.  The redux-observale term for this pattern is an _epic_.  The epic pattern extends the action flow in the above diagram with the steps shaded in gray:

<ol start="4">
<li>The epic observes the action and the updated state
<li>The epic dispatched one or more actions
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

This is all well documented in the [redux-middleware](https://redux.js.org/docs/advanced/Middleware.html) and [redux-observale](https://redux-observable.js.org/docs/basics/Epics.html) docs, from where I grabbed the above code snippet.

## Dispatching multiple actions

Sometimes you want to dispatch multiple Actions from an epic.  For instance what if you want to both update the UI with the returned data, and trigger a subsequent async data retrieval.  In this scenario we can change the epic to return an Observable of actions rather than a single action, as in:

```js
const fetchUserEpic = action$ =>
  action$.ofType(FETCH_USER)
    .mergeMap(action => ajax.getJSON(`https://api.github.com/users/${action.payload}`))
    .mergeMap(response => [
       fetchUserFulfilled(response),  // update the store with the returned data
       fetchAdditionalUserData() // An action to fetch the accounts of a user
    );
```

In working with the above pattern, I came to a point where I wanted to know the order in which such a sequence of Actions was reduced.  Consider the following scenario:

1. Dispatch an action `ACTION_1`
2. Reduce `ACTION_1`
3. Trigger an epic
4. Dispatch an array of actions from the epic [ `ACTION_2`, `ACTION_3`]
5. Invoke the reducer for `ACTION_2`
6. Trigger an epic
7. Dispatch another array of actions from this epic [ `ACTION_1b`, `ACTION_2b`, `ACTION_3b` ]
8. ... reduce an action, but witch action will be reduced next ???

I came up with two possible scenarios:

**Scenario 1**: The next action dispatched `ACTION_3` will be reduced, followed by the subsequently dispatched actions `ACTION_1b`, `ACTION_2b`, `ACTION_3b`.

**Scenario 2**: `ACTION_2` and all it's dispatched actions will be reduced, before proceeding the `ACTION_3`.

The easiest way to answer this question is with some code that implements the above sequence of steps:

```js
import { createStore, applyMiddleware, compose, combineReducers } from 'redux';
import { createEpicMiddleware, combineEpics } from 'redux-observable';

const makeActionCreator = (type, ...argNames) => {
    return function (...args) {
        console.log('Creating action', type, args[0]);
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
    ACTION_1B = 'ACTION_1b',
    ACTION_2B = 'ACTION_2b',
    ACTION_3B = 'ACTION_3b'
}

const dispatchAction1 = makeActionCreator(Actions.ACTION_1, "value");
const dispatchAction2 = makeActionCreator(Actions.ACTION_2, "value");
const dispatchAction3 = makeActionCreator(Actions.ACTION_3, "value");
const dispatchAction1b = makeActionCreator(Actions.ACTION_1B, "value");
const dispatchAction2b = makeActionCreator(Actions.ACTION_2B, "value");
const dispatchAction3b = makeActionCreator(Actions.ACTION_3B, "value");

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
        case Actions.ACTION_1B:
            console.log('Reducing action 1b');
            return {
                ...state,
                value1b: action.value
            }
        case Actions.ACTION_2B:
            console.log('Reducing action 2b');
            return {
                ...state,
                value2b: action.value
            }
        case Actions.ACTION_3B:
            console.log('Reducing action 3b');
            return {
                ...state,
                value3b: action.value
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

const action2Epic = (action$, store) =>
    action$.ofType(Actions.ACTION_2)
    .mergeMap(action => [
        dispatchAction1b("From 2"),
        dispatchAction2b("From 2"),
        dispatchAction3b("From 2")
    ]);


const testEpics = combineEpics(action1Epic, action2Epic);

const epicMiddleware = createEpicMiddleware(testEpics);
const testStore = createStore(
    testReducer,
    applyMiddleware(epicMiddleware)
);

// Dispatch the first action
testStore.dispatch(dispatchAction1("From the top."));
```

On running this code snippet we can inspect the console log to see the order in which the actions were dispatched and reduced:

```none
Creating action ACTION_1 From the top.
test-epics.ts:35 Reducing action 1
test-epics.ts:6 Creating action ACTION_2 From 1
test-epics.ts:6 Creating action ACTION_3 From 1
test-epics.ts:41 Reducing action 2
test-epics.ts:6 Creating action ACTION_1b From 2
test-epics.ts:6 Creating action ACTION_2b From 2
test-epics.ts:6 Creating action ACTION_3b From 2
test-epics.ts:53 Reducing action 1b
test-epics.ts:59 Reducing action 2b
test-epics.ts:65 Reducing action 3b
test-epics.ts:47 Reducing action 3
explorer-redux.ts:224 fetching dna api routes for test
```

## Conclusion

From this output we can see `ACTION_1b`, `ACTION_2b`, and `ACTION_3b` are all reduced before `ACTION_3`.  We can conclude that _Scenario 2_ is correct:

> When a sequence of actions is dispatched from an epic, each action will be reduced along with any synchronously dispatched actions from observing epics, prior to reducing subsequent actions in the initial sequence.

Understanding what's happening here is by no means necessary to incorporate redux-observable in your application, but hopefully my documentation of this behavior proves useful to someone.  If so, please let me know in the comments!
