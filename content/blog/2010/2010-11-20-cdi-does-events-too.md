---
  title: CDI does events too!
  date: 2010-11-20
  author: Brian Leathem
  categories: [Java EE]
  tags: [ java ee 6, CDI ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2010-11-20-cdi-does-events-too
  disqus_title: cdi-does-events-too
  disqus_url: http://blog.bleathem.ca/2010/11/cdi-does-events-too.html
  aliases:
    - /blog/2010/11/cdi-does-events-too.html
---

CDI is the new programming model introduced with Java EE 6.  An acronym for Contexts and Dependency Injection, CDI advertises well two of the programming paradigms it aims to solve.  But there is another, often overlooked sibling: Event handling.  While I'd heard it mentioned in the context of CDI, I'd never really paid much attention - I was probably too busy trying to wrap my head around Conversations, and how CDI provides Dependency Injection.  And me being me, once I learn something cool, I have to tell everyone who will isten all about it!

Adam Bien does a fantastic job introducing CDI events in his <a href="http://www.adam-bien.com/roller/abien/entry/java_ee_6_observer_with">blog entry</a>.  There are only three really noteworthy lines of code that I will repeat here:

```java
@Inject Event&lt;helloevent&gt; events;
```
```java
events.fire(new HelloEvent(...));
```
```java
public void listenToHello(@Observes HelloEvent helloEvent){ ... }
```

These three lines are all that's required to produce and observe the event.  Anyone who's programmed with Swing knows the benefit of decoupling concerns with action events and action listeners.  This is the same thing, only far more elegantly implemented.

One of distinguishing points for me is the POJO nature of the events.  With nothing to extend or implement, they can be as simple or as complex as necessary.  All without the loss of (compile-time) type safety, due to the generic implementation.

Well done guys, CDI just got that much better for me!
