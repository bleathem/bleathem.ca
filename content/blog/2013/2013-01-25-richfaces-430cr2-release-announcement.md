---
  title: "RichFaces 4.3.0.CR2 Release Announcement"
  date: 2013-01-25
  author: Brian Leathem
  categories: [Java EE]
  tags: [ RichFaces, RF43 ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2013-01-25-richfaces-430cr2-release-announcement.html
---

{{< figure src="/img/blog/common/richfaces.png" title="RichFaces" link="http://richfaces.org/" >}}

The second milestone release of RichFaces 4.3 ([4.3.0.CR2](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320975)) has been released. This release candidate for the RichFaces 4.3 is an incremental release on top of the previous release candidate ([4.3.0.CR1](http://www.bleathem.ca/blog/2013/01/richfaces-430cr1-release-announcement.html)), providing a few bug fixes and documentation enhancements.

div(alert alert-info). **To try out this release:** You can download the distribution [directly](http://www.jboss.org/richfaces/download/milestones), or for maven users, increment the RichFaces version in your pom.xml to 4.3.0.CR2. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

Behaviour change for `<rich:notify>`
------------------------------------

The RichFaces notify\* components did not previously escape message content. This can lead to a security vulnerability in your applications, so we've changed the notify\* components to escape message content by default, and provided the `escape` attribute to disable escaping of the message content.

div(alert alert-warning). If you previously had HTML content in your notify\* components, you will need to add the `escape=false` attribute to achieve the same behaviour as in previous RichFaces releases.

### Moving forward

We'll again let RichFaces 4.3.0.CR2 bake in the community for a few days. Be sure to try it our with your applications and [report any regressions](https://issues.jboss.org/browse/RF) you should come across that may have been overlooked by our [QE team](http://blog.pavol.pitonak.com/2012/09/meet-richfaces-qe-team.html). We are aiming to have a final release out next week.
