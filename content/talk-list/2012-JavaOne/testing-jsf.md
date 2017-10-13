---
type: itemized
author: Brian Leathem
date: 2012-10-04
title: Testing JSF Applications With Arquillian And Selenium
description: How to test JSF applications with Arquillian and Selenium
featured:
featuredpath:
featuredalt:
categories: []
conference: 2012-JavaOne
slides: http://www.bleathem.ca/talks/2012-JavaOne/testing-jsf.html
video: https://www.youtube.com/watch?v=pfoJAshalx4
---

In modern development environments, it’s a “must” to include testing of web applications as a standard part of the development life-cycle. Such tests can also be used as acceptance criteria in enterprise projects. While full-automation is possible, it is considered to be very expensive. As a result, in projects where testing is included as part of the project plan, it is also often the first requirement cut when the project schedule begins to slip.
JSF projects can be particularly difficult to test with basic tools. We’ve seen a revolution with Arquillian that has made integration testing a breeze. Similarly, Selenium helps in UI testing automation. However, neither Arquillian nor Selenium can save the world alone, as their are some outstanding problems that neither of these technologies address:
- UI test development is slow and decreases developer productivity - Client/server co-operation lacks coverage, each is tested independently - Selenium tests only: page transitions, JavaScript interaction, and a portion of the DOM - The number of Selenium tests can increase quickly, leaving you with maintenance burden In an effort to reduce the impact of these concerns, we will look at current best practices of how to achieve a rapid turnaround for test development. We’ll also investigate how to take a client-side test to the server and back, verifying state at both ends. Techniques will be shared for minimizing the effort required to write tests, thereby increasing productivity and making your tests future-proof.
