---
layout: post
title: "RichFaces 4.3.0.M3 Release Announcement"
tags: [ RichFaces, RF43 ]
---

!>/images/blog/common/richfaces.png(RichFaces)!:http://richfaces.org/

The third milestone release of RichFaces 4.3 ("4.3.0.M3":https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320295) is now available.  This 3rd and final milestone for the RichFaces 4.3 release brings in a number of huge features, including new components, some long-time outstanding feature migrations from RichFaces 3, and some significant bug fixes.  Read on for some details of these release highlights, or go straight to the "Release Notes":https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320295 for a complete list of what's been addressed.

div(alert alert-info). *To try out this release:* You can download the distribution "directly":http://www.jboss.org/richfaces/download/milestones, or for maven users, increment the RichFaces version in your pom.xml to 4.3.0.20121214-M3. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

h2. New Components

We've incorporated a couple of RichFaces Sandbox components in RichFaces 4.3.0.M3: the rich:focus and rich:placeholder components, created by "Bernard Labno":https://community.jboss.org/people/blabno.

We will update the "RichFaces Documentation":http://www.jboss.org/richfaces/docs with all the details of these new components in the course of our 4.3.0.CR1 preparations.  In the mean time feel free to explore these components yourselves referring to the showcase snapshot samples linked to below.

h3. rich:focus

The rich:focus component provides a rigorous means of controlling which inputs on your page have the keyboard focus.  The focus manager integrates with JSF to automatically focus Inputs that fail validation.  

Have a look at the "demo in our showcase snapshot":http://showcaselatest-richfaces.rhcloud.com/richfaces/component-sample.jsf?demo=focus for an example of how to use the focus component.

h3. rich:placeholder

The placeholder component let's one set a "hint" that is a description of the expected value of an input component  This component allows RichFaces developers to take advantage of the "HTML 5 placeholder attribute":http://www.w3schools.com/html5/att_input_placeholder.asp functionality in all browsers, including in those browsers that don't explicitly support the attribute.

Check out the "usage examples in the RichFaces showcase snapshot":http://showcaselatest-richfaces.rhcloud.com/richfaces/component-sample.jsf?demo=placeholder to see how the placeholder component is used.

h2. New ExtendedDataTable Features

With this third milestone release of RichFaces 4.3, we've ported a couple of new features forward for the rich:extendedDataTable component.  Both the "table state saving functionality":https://issues.jboss.org/browse/RF-10442 and "built-in sorting/filtering":https://issues.jboss.org/browse/RF-8125 features from RichFaces 3 have been ported to the RichFaces 4 implementation on the rich:extendedDataTable.  Check out the built-in sorting/filtering in our "showcase snapshot sample":http://showcaselatest-richfaces.rhcloud.com/richfaces/component-sample.jsf?demo=extendedDataTable&sample=edt-builtin-sorting-and-filtering.

div(alert alert-error). The introduction of built-in sorting/filtering will have a noticeable side-effect for those of you already using sorting/filtering functionality with the rich:extendedDataTable.  To prevent a "doubling up" of the controls, you will have to introduce the <code>sortType="custom"</code> and <code>filterType="custom"</code> attributes.

With RichFaces 4.3.0.CR1 we will provide a way to "centrally disable built-in sorting/filtering":https://issues.jboss.org/browse/RF-12683 allowing users to adopt RichFaces 4.3 without any required code changes.

h2. Ajax improvements

A number of fixes have gone into this release in the area of RichFaces ajax, each of these issues is significant in it's own right:

* "RF-12442":https://issues.jboss.org/browse/RF-12442 addresses the use of RichFaces with multiform JSF pages, a significant improvement for a number of use cases.
* "RF-12229":https://issues.jboss.org/browse/RF-12229 fixes broken <code>render="@all"</code> functionality
* "RF-12642":https://issues.jboss.org/browse/RF-12642 introduces two new events ajaxbegin and ajaxbeforedomupdate

h2. Other Significant Fixes

In addition to the new components and features listed above, I'd like to call out a few more areas that have seen improvements:

* The RichFaces Kitchensink Archetype has been "updated":https://issues.jboss.org/issues/?jql=project%20%3D%20RF%20AND%20fixVersion%20%3D%20%224.3.0.M3%22%20AND%20(status%3D%20Resolved%20or%20status%3D%20closed)%20and%20component%20%3D%20archetype%20ORDER%20BY%20component%20asc%2C%20priority%20DESC%2C%20id%20ASC, 
* A number of "drag and drop improvements":https://issues.jboss.org/issues/?jql=project%20%3D%20RF%20AND%20fixVersion%20%3D%20%224.3.0.M3%22%20AND%20(status%3D%20Resolved%20or%20status%3D%20closed)%20and%20component%20%3D%20%22component-drag%2Fdrop%22%20ORDER%20BY%20component%20asc%2C%20priority%20DESC%2C%20id%20ASC have been put in place.  
* We've added a "MyFaces profile":https://issues.jboss.org/browse/RF-12581 MyFaces showcase for the RichFaces showcase.

Finally I'll point out we've updated a some of the libraries on which RichFaces builds it's functionality:

* "RF-12630":https://issues.jboss.org/browse/RF-12630 jQuery UI upgrade to 1.9.2
* "RF-12631":https://issues.jboss.org/browse/RF-12631 jQuery upgrade to 1.8.3
* "RF-12633":https://issues.jboss.org/browse/RF-12633 CK editor upgrade to 3.6.5

h2. Testing improvements

With this milestone we've really stretched the legs of the "new testing infrastructure":https://issues.jboss.org/browse/RF-12578 based on the Arquillian extensions "Graphene":http://arquillian.org/modules/graphene-extension/ and "Warp":http://arquillian.org/modules/warp-extension/.  Our so-called "Fundamental tests" (or "fun tests" for short) run in container and against real browsers and have proved invaluable in issue reproduction, isolation, and verification.

"Check out these tests for yourselves":https://github.com/richfaces/components/ and use them as an inspiration for how you can test your own JSF applications.  Using this test infrastructure ourselves is helping us to nail down the required APIs and functionality, and we could use your help in ensuring we are covering as many use cases as possible.

h2. Moving Forward

We've already been hard at work resolving some bugs and regressions discovered by the RichFaces QA team.  These will be available in the new year as our RichFaces 4.3.0.CR1 release, and Final is just one short hop beyond that.

With RichFaces 4.3 nearly complete and under our belt, it's time to shift focus to RichFaces 5 and all the significant changes we want to bring in with that major release.  Be sure to drop by the "developer forum":https://community.jboss.org/thread/213160 and share your insight as to where the project should be headed.