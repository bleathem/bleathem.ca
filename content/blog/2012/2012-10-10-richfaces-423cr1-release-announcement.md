---
  title: "RichFaces 4.2.3.CR1 Release Announcement"
  date: 2012-10-10
  author: Brian Leathem
  categories: [Java EE, RichFaces]
  tags: [ RichFaces, RF42, Portal, Community ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2012-10-10-richfaces-423cr1-release-announcement
  disqus_title: richfaces-423cr1-release-announcement
  disqus_url: http://blog.bleathem.ca/2012/10/richfaces-423cr1-release-announcement.html
  aliases:
    - /blog/2012/10/richfaces-423cr1-release-announcement.html
---

{{< figure src="/img/blog/common/richfaces.png" title="RichFaces" link="http://richfaces.org/" >}}

I am happy to announce that the first candidate release of RichFaces 4.2.3 ([4.2.3.CR1](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320071)) is now available. This is purely a bug-fix release, with a focus on compatibility between RichFaces and the [JBoss Portlet Bridge](http://www.jboss.org/portletbridge).

div(alert alert-info). **To try out this release:** You can download the distribution [directly](http://www.jboss.org/richfaces/download/milestones), or for maven users, increment the RichFaces version in your pom.xml to 4.2.3.CR1. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

Portlet Bridge Fixes
--------------------

RichFaces aims to be a container agnostic project, working in Servlet containers, Java EE implementations, and Portals, all from multiple vendors. Of course keeping up with bugs and fixes across all these deployment environments is a lot of work, so we naturally tend to focus our efforts on certain specific environments. As such, nothing makes us happier then receiving github pull requests addressing compatibility issues between RichFaces and one of these deployment containers.

This is precisely what Ken Finnigan of the Portal Bridge team has done, identifying and resolving a number of issues with RichFaces when running in a Portlet environment. Unfortunately a number of servlet specific references leaked through in some of our implementations, but Ken has done an excellent job rounding these up, and replacing them with the appropriate JSF abstraction, ensuring RichFaces components work equally well in servlet and portlet environments. Great job Ken!

Community Contributions
-----------------------

I'd also like to call out , [Bernard Labno](https://community.jboss.org/people/blabno), [Christian Kaltepoth](https://issues.jboss.org/secure/ViewProfile.jspa?name=chkal), and [Luca Nardelli](https://community.jboss.org/people/tritibo) for the bugs they fixed and submitted as github pull requests. RichFaces is a very much a community project, and it's in part contributions like these that keep the project healthy and moving forward. Thanks guys -- and keep those pull requests coming!

Release Notes:
--------------

Specific issues resolved with this release include:

<blockquote>
<h3>
Bug

</h3>
<ul>
<li>
\[<a href='https://issues.jboss.org/browse/RF-10758'>RF-10758</a>\] - Input fields in popupPanel lose focus

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-10980'>RF-10980</a>\] - Impossible to set tabindex of input inside rich:popupPanel

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-11051'>RF-11051</a>\] - a4j.version does not work

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-11104'>RF-11104</a>\] - rich:inputNumberSlider slider position is affected by css position attribute of containing element

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12113'>RF-12113</a>\] - rich:inputNumberSpinner minValue and maxValue being ignored after second request

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12114'>RF-12114</a>\] - Richfaces 4.2 rich:autocomplete don't fire ajax on blur event

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12221'>RF-12221</a>\] - rich:orderingList: fix VDL-DOC of `listHeight, `maxListHeight, `minListHeight, `listWidth

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12256'>RF-12256</a>\] - DragAndDrop + position: absolute results in broken positioning

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12273'>RF-12273</a>\] - rich:fileUpload does not work in portlets because it does not utilize javax.faces.encodedURL for the XmlHttpRequest URL

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12424'>RF-12424</a>\] - Showcase contains Servlet specific code

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12425'>RF-12425</a>\] - Showcase fails to load SyntaxHighlighter scripts when Require.js is present

</li>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12476'>RF-12476</a>\] - Resource Name in mapping for two menu images is incorrect

</li>
</ul>
<h3>
Enhancement

</h3>
<ul>
<li>
\[<a href='https://issues.jboss.org/browse/RF-12343'>RF-12343</a>\] - Problem when saving form with rich picklist inside composite component

</li>
</ul>
</blockquote>
What's next?
------------

Be sure to take this candidate release for a spin, and report back any regressions. We are expecting the 4.2.3.Final release to simply be a re-tag of the CR1 release, barring any unforeseen blockers.

In the mean time we are hard at work on our the 4.3 release train, and are working on having a [4.3.0.M2](https://issues.jboss.org/browse/RF/fixforversion/12319880) release available hot-on-the-heels of this 4.2.3 release.
