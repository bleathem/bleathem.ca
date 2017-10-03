---
  title: "RichFaces 4.2.1.Final Release Announcement"
  date: 2012-04-17
  author: Brian Leathem
  categories: [Java EE, RichFaces]
  tags: [ RF42, Final, RichFaces ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2012-04-17-richfaces-421final-release-announcement
  disqus_title: richfaces-421final-release-announcement
  disqus_url: http://blog.bleathem.ca/2012/04/richfaces-421final-release-announcement.html
  aliases:
    - /blog/2012/04/richfaces-421final-release-announcement.html
---

We've released RichFaces<a href="https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&amp;version=12319306"> 4.2.1.Final</a> - the first micro release for the 4.2 release train. Since the CR1 release we've primarily addressed bugs with the Richfaces showcase and the RichFaces archetypes.  CR1 itself focused on bug fixes and stability improvements throughout the framework.

To try out this release, you can download the distribution <a href="http://www.jboss.org/richfaces/download/stable">directly</a>, or for maven users, increment the RichFaces version in your pom.xml to 4.2.1.Final. For more information on setting up a RichFaces 4 application, refer to our <a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x">getting started guide</a>.

## What’s in 4.2.1.Final?

One noteworthy issue to take note of:

* [<a href="https://issues.jboss.org/browse/RF-11940">RF-11940</a>] - Our ajax push component (a4j:push) was not receiving pushes from the server on Android devices. We identified a bug in the Atmosphere framework which powers our push technology, a bug which we fixed and pushed back <a href="https://github.com/Atmosphere/atmosphere/commit/439beed40f6877edfc98ea60b70c8d76f7179a74">upstream</a> (OSS for the win!).

Be sure to check out the <a href="http://blog.bleathem.ca/2012/04/richfaces-421cr1-release-announcement.html">4.2.1.CR1 release blog</a> for a more complete picture of what we addressed with this micro release.

New with this release, we are once again deploying the showcase on new infrastructure. The OpenShift Express service has been unified with OpenShift Flex to deliver a single service now simply referred to as OpenShift (see <a href="https://www.redhat.com/openshift/community/faq/what-happened-to-express">this FAQ entry</a>). The end result for us is a simplified deployment and management console, and an easier ability to host multiple applications.

## Moving Forward

We’re currently focused on improving the <a href="https://community.jboss.org/message/729909">JSF testing</a> and <a href="https://community.jboss.org/wiki/RichFacesMobile">RichFaces mobile</a> stories. However we’ll shortly begin our <a href="https://issues.jboss.org/browse/RF/fixforversion/12318553">4.3.0.M1</a> sprint which will focus on MyFaces compatibility issues. Concurrent to all this, we will working in the <a href="https://github.com/richfaces/sandbox">RichFaces Sandbox</a> to deliver our <a href="https://community.jboss.org/thread/177406">next-generation component set</a>. Should any of the above initiatives appeal to you, feel free to <a href="https://community.jboss.org/wiki/RichFacesWikiHomePage#contribute">get involved</a> and help move the project forward!
