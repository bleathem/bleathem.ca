---
  title: RichFaces 4.1.0.M1 Release Announcement
  date: 2011-08-16
  author: Brian Leathem
  categories: [Java EE, RichFaces]
  tags: [ RF41, RichFaces ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2011/08/richfaces-410m1-release-announcement.html
---

The <a href="http://richfaces.org/">RichFaces</a> team is proud to announce the first milestone release of RichFaces 4.1. This release includes some significant contributions from community members, adding to and building on top of the efforts of the RichFaces core developer team! You can find this development release on the project’s <a href="http://www.jboss.org/richfaces/download/milestones">download page</a> and check out our “<a href="http://community.jboss.org/wiki/GettingStartedWithRichFaces4x">getting started</a>” resources.

## First Milestone for 4.1

The 4.1.0 Milestone1 release includes several highly anticipated features and improvements in RichFaces 4.

We have new components:

* Editor
* Pick List
* Ordering List
* Notify

In addition, we’ve made some big improvements to the Push component.  It is now more lightweight, decoupled from JMS, and support has been added for <a href="http://en.wikipedia.org/wiki/Comet_%28programming%29">Comet</a> - the websockets-like light alternative for long-poliing.  A Push demo has also been added to the RichFaces Showcase, with support for JBoss AS 7 (although not yet visible in the <a href="http://richfaces.org/showcase">public showcase</a>, the code is <a href="https://github.com/richfaces/showcase/tree/master/src/main/webapp/richfaces/push">available</a>).

In addition, a new sample application <a href="https://github.com/richfaces/tweetstream">Tweetstream</a> has been developed.  This application demonstrates the “mobile platform” directions and capabilities that can be expected from future releases of RichFaces.

## New Components

Three of the new components, “Editor”, “Pick List”, and “Ordering List” are components that were available in RichFaces 3, but were not present in the initial RichFaces 4 release.  With this first milestone release for RichFaces 4.1, we have remedied this and provided these missing components.  The 4th new component, “Notify”, is a community contributed component, the first component contributed from <a href="http://community.jboss.org/people/blabno">Bernard Labno</a> - a RichFaces community enthusiast.  Let’s take a closer look at each of these components:

The Editor component has been rewritten from scratch, and is now based on the <a href="http://ckeditor.com/">CKEditor</a> implementation. It traditionally supports two modes of toolbar button configuration (basic and full) and nicely integrates to rest of the RichFaces AJAX  framework. In the milestone 2 release, it will also get a new Look & Feel to be better aligned with the rest of the component suite.  For further details, see <a href="http://rik-ansikter.blogspot.com/2011/08/editor-for-richfaces-41.html">Lukas’ blog post</a> on the rich editor.

<img height="416px;" src="/img/blog/2011-08-16-richfaces-410m1-release-announcement/2011-08-16-richfaces-410m1-release-announcement_1.png" width="606px;" />

The Pick List and Ordering List are two other components that were sorely missed by the community since RichFaces 3, and they have now been re-introduced.  The new Pick List in RichFaces 4 incorporates the functionality of both the List Shuttle and Pick List components from RichFaces 3. The API of this Pick List component has been specifically redesigned to follow the f:selectItems pattern and to allow a quick transition from the h:selectMany component.

<img height="102px;" src="/images/blog/2011-08-16-richfaces-410m1-release-announcement/2011-08-16-richfaces-410m1-release-announcement_2.png" width="568px;" />

Lastly, the Notify component provides interactive feedback from your applications complementary to standard messages.  The look and behaviour of the Notify component was Inspired by Mac OS’s growl to provide your JSF applications with a more rich user experience

The components provided in this first milestone are functionally complete, so you can take them for a spin, and provide us with your feedback about any functionality or key API’s we might have missed (or where we got it right!)

## Migration to Git

New features and functionality have not been our sole focus. In preparation for this release we’ve migrated our entire framework to <a href="https://github.com/richfaces">GitHub</a> and broken it up into several modules.  The main goal we had in mind with this migration was to make contributing to the RichFaces framework easier, and help us extend the level of collaboration.  I think we can say we’ve definitely achieved this goal, given the number of community contributions we’ve already seen.

With GitHub, it is now pretty easy to send patches to the project in form of pull requests. Thanks to <a href="http://nvie.com/posts/a-successful-git-branching-model/">git-flow</a> it is now trivial process to develop new features in feature branches and, because of <a href="http://git-scm.com/">Git</a> itself, it is easy to merge them back into the most recent development branch.

## Next Milestone

<a href="https://issues.jboss.org/browse/RF/fixforversion/12316708">Milestone 2</a> will be a great sprint for ironing out the details of the new components’ features as well as polish their look&feel.  Most importantly however, we will focus on further stabilization of the framework by fixing bugs both reported by the community and those found by our QE team. A lot of work is also planned for mobile devices support, and as previously mentioned, we are working on initial versions of a Mobile Showcase.

## Face to Face Meeting

After Milestone2, the globally distributed RichFaces team will get together with some other JBoss teams in Toronto, Canada,  to discuss the future of the framework itself and it’s integration with other parts of Java EE.  The goal of this meeting is to offer you, the developer, the best development experience possible. Should you be around Toronto in September and would like to join us for an evening beer, you are more than welcome. ;-)

## Give it a spin!

Go ahead, and <a href="http://www.jboss.org/richfaces/download/milestones">download</a> this first Milestone release of RichFaces 4.1 (or add the <a href="http://community.jboss.org/wiki/HowToAddRichFaces4xToMavenBasedProject">dependency</a> to your maven pom file), and give the new components a spin.  Let us know what you think, either where we’ve missed something, or where we got it right, and help shape the component for the upcoming 4.1.0.Final release.
