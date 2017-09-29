---
  title: "RichFaces 4.3.1.Final Release Announcement"
  date: 2013-03-07
  author: Brian Leathem
  categories: [Java EE, RichFaces]
  tags: [ RichFaces, RF43 ]
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2013/03/richfaces-431final-release-announcement.html
---

{{< figure src="/img/blog/common/richfaces.png" title="RichFaces" link="http://richfaces.org/" >}}

The final release of RichFaces 4.3.1 ([4.3.1.Final](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320558)) has been released. This micro release addresses some bugs present in the [4.3.0.Final release](http://www.bleathem.ca/blog/2013/02/richfaces-430final-release-announcement.html), and offers some improvements on the new features introduced in that same release. Have a look at the [4.3.1.Final Release Notes](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320558) for a complete listing if what was included in this release.

div(alert alert-info). **To try out this release:** You can download the distribution [directly](http://www.jboss.org/richfaces/download/stable), or for maven users, increment the RichFaces version in your pom.xml to 4.3.1.Final. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

Release Highlights
------------------

Perhaps the most significant change introduced in this release is in issue [RF-12803](https://issues.jboss.org/browse/RF-12803), where we've included the `<a4j:ajax>` [JavaScript service extension](http://alexsmirnov.wordpress.com/2011/03/24/richfaces-javascript-service/) in `<f:ajax>` execution. This service allows RichFaces components to serve and execute JavaScript after the page content is loaded, leading to improved page performance. As we've continued to use this service more extensively throughout our components, we realized we had to integrate the extension with the JSF 2 `<f:ajax>` behaviour, or we would forever be reminding people to use `<a4j:ajax>` instead (which you should be using anyway for all sorts of [additional reasons](http://mkblog.exadel.com/2010/08/what-richfaces-a4jajax-adds-on-top-jsf-2-fajax-tag/)).

The RichFaces push component has been upgraded to use the latest release of the [Atmosphere library](http://async-io.org/), with the resolution of [RF-12689](https://issues.jboss.org/browse/RF-12689). If you haven't yet started using the easy-to-use RichFaces push component in your application (with optional CDI and JMS integration) be sure to follow these [4 simple steps for RichFaces Push](http://rik-ansikter.blogspot.ca/2012/02/configuring-richfaces-push-with-42.html).

Moving forward
--------------

With RichFaces 4.3.1 out, we will next shift gears back into RichFaces 5 development, working on the new consolidated [RichFaces 5 repository](https://github.com/richfaces/richfaces5). Stay tuned for a first RichFaces 5 milestone release!
