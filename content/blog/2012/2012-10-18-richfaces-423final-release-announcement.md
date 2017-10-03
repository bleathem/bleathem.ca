---
  title: "RichFaces 4.2.3.Final Release Announcement"
  date: 2012-10-18
  author: Brian Leathem
  categories: [Java EE, RichFaces]
  tags: [ RichFaces, RF42, Final, Portal, Community ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2012-10-18-richfaces-423final-release-announcement
  disqus_title: richfaces-423final-release-announcement
  disqus_url: http://blog.bleathem.ca/2012/10/richfaces-423final-release-announcement.html
  aliases:
    - /blog/2012/10/richfaces-423final-release-announcement.html
---

{{< figure src="/img/blog/common/richfaces.png" title="RichFaces" link="http://richfaces.org/" >}}

RichFaces [4.2.3.Final](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320368) has been released. This *Final* release is a **re-tag** of the [4.2.3.CR1](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320071) release as no blocking issues were found by either our [QE team](http://blog.pavol.pitonak.com/2012/09/meet-richfaces-qe-team.html), nor by the community.

The RichFaces 4.2.3.Final release is purely a bug-fix release, with a focus on compatibility between RichFaces and the [JBoss Portlet Bridge](http://www.jboss.org/portletbridge). I'll refer you to the [RichFaces 4.2.3.CR1 release blog](http://www.bleathem.ca/blog/2012/10/richfaces-423cr1-release-announcement.html) for details of the release, with a special highlight paid to the contributions from the JBoss Portal Bridge team, and contributions from community members.

div(alert alert-info). **To try out this release:** You can download the distribution [directly](http://www.jboss.org/richfaces/download/stable), or for maven users, increment the RichFaces version in your pom.xml to 4.2.3.Final. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

Release Notes:
--------------

To re-cap, the changes in the 4.2.3.Final release compared to the [4.2.2.Final](http://stage.bleathem.ca/blog/2012/05/richfaces-422final-release-announcement.html) release include:

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
This is very much a community driven release. Thanks guys, you rock!

Stay Tuned for 4.3.0.M2
-----------------------

The QA process for the 4.3.0.M2 release is about to begin, with a release as soon as QA is done. So stay tuned, as there is lots more great stuff to come!
