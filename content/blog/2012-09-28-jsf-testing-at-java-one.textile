---
layout: post
title: "JSF-Testing Session at Java One"
tags: [ Arquillian, JSF, testing, Graphene, Warp, Drone ]
---

I'll speaking next week at "Java One":http://www.oracle.com/javaone/ on the topic of _"Testing JSF Applications with "Arquillian":http://arquillian.org and "Selenium":http://seleniumhq.org/"_.  The Session co-ordinates are as follows:

div(alert alert-info). _Testing JSF Applications with Arquillian and Selenium_
+"CON7622":https://oracleus.activeevents.com/connect/sessionDetail.ww?SESSION_ID=7622+: Thursday, Oct 4, 2:00 PM - 3:00 PM - Parc 55 - Cyril Magnin I

Unfortunately the Java One website truncated the abstract, and the bit that's left doesn't give you a good idea of what I'm talking about.  Let's correct that right away!

We'll start with a review of Arquillian and Selenium, then look at the Arquillian extensions Drone, Graphene, and Warp and how we can use them to write effective JSF tests.  These tools allow us to write "real" tests without the need for mocking the JSF environment, nor running in a crippled client container.

For the sake of completeness, here's the abstract as originally submitted:

h2. Abstract

<blockquote>
In modern development environments, it’s a “must” to include testing of web applications as a standard part of the development life-cycle.  Such tests can also be used as acceptance criteria in enterprise projects. While full-automation is possible, it is considered to be very expensive. As a result, in projects where testing is included as part of the project plan, it is also often the first requirement cut when the project schedule begins to slip.
<br/>
JSF projects can be particularly difficult to test with basic tools. We’ve seen a revolution with Arquillian that has made integration testing a breeze.  Similarly, Selenium helps in UI testing automation. However, neither Arquillian nor Selenium can save the world alone, as their are some outstanding problems that neither of these technologies address:
<br/>
* UI test development is slow and decreases developer productivity
* Client/server co-operation lacks coverage, each is tested independently
* Selenium tests only: page transitions, JavaScript interaction, and a portion of the DOM
* The number of Selenium tests can increase quickly, leaving you with maintenance burden

In an effort to reduce the impact of these concerns, we will look at current best practices of how to achieve a rapid turnaround for test development.  We’ll also investigate how to take a client-side test to the server and back, verifying state at both ends. Techniques will be shared for minimizing the effort required to write tests, thereby increasing productivity and making your tests future-proof.
</blockquote>
