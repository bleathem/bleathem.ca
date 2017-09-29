---
  title: "RichFaces 4.1.0.CR2 Release Announcement"
  date: 2011-12-06
  author: Brian Leathem
  tags: [ RF41, RichFaces ]
  categories: [Java EE]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2011/12/richfaces-410cr2-release-announcement.html
---

We are announcing the release of RichFaces <a href="https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&amp;version=12318315">4.1.0.CR2</a>, a second release candidate for RichFaces 4.1. We had a couple of <a href="https://issues.jboss.org/secure/IssueNavigator.jspa?reset=true&amp;jqlQuery=project+%3D+RF+AND+fixVersion+%3D+%224.1.0.CR2%22+AND+component+%3D+regression">regressions</a> that were introduced in the <a href="https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&amp;version=12317055">4.1.0.CR1</a> release that we’ve addressed in the with this CR2 release. The expectation is that CR2 will be re-tagged and released as 4.1.0.Final, provided no blocking issues are found. Our QE team has done a great job running their test suite against this release, but I encourage as many community members as possible to download the CR2 release, and make sure it’s “up to snuff”!

To try out this release, you can download the distribution <a href="http://www.jboss.org/richfaces/download/milestones">directly</a>, or for maven users increment the RichFaces version in your pom.xml to 4.1.0.CR2. For more information on setting up a RichFaces 4 application, refer to our <a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x">getting started guide</a>.

## Noteworthy changes

In addition to addressing the above regressions, our CR2 release has addressed a couple other noteworthy issues.

* showcase tweaks: improving the user experience on both desktop and mobile
* archetype improvements: including the addition of an option for creating a mobile project
* skins: warning messages had an unreadable color on a white background - (warningColor) [<a href="https://issues.jboss.org/browse/RF-11673">RF-11673</a>]
* rich:inplaceInput: a fix for client side validation [<a href="https://issues.jboss.org/browse/RF-11633">RF-11633</a>]
* rich:dataTable: a fix for a regression effecting component decoding [<a href="https://issues.jboss.org/browse/RF-11675">RF-11675</a>]
* rich:calendar: a fix for a regression selecting dates in the popup [<a href="https://issues.jboss.org/browse/RF-11677">RF-11677</a>]
* rich:pickList: a bug converting java arrays when used as backing beans [<a href="https://issues.jboss.org/browse/RF-11680">RF-11680</a>]
* rich:fileUpload: A bug where the list of files in the event omitted the submitted files [<a href="https://issues.jboss.org/browse/RF-11744">RF-11744</a>]
* rich:extendedDataTable: removed cellpadding/cellspacing from EDT, replaced with appropriate CSS [<a href="https://issues.jboss.org/browse/RF-11759">RF-11759</a>]

Please test drive this second release candidate, and give us your feedback in either the forums or with our issue tracker. We’ll soon have a 4.1.0.Final release we all can be proud of, for the work we put into it as a community!
