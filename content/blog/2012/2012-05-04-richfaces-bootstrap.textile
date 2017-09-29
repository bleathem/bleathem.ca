---
layout: post
title: "RichFaces Bootstrap"
tags: [ Bootstrap, CDK, RichFaces ]
---

I'm happy to share the news that the RichFaces community has started an effort to wrap <a href="http://twitter.github.com/bootstrap/">Twitter Bootstrap</a> with the RichFaces <a href="https://community.jboss.org/wiki/RichFacesCDKHowTos">CDK</a>. If you haven't yet heard, Twitter's Bootstrap project is a set of HTML/CSS/js "widgets" that you can use for building a website/web application with an emphasis on a fluid layouts that adapt well to mobile devices. The RichFaces community effort centres around <a href="https://github.com/richfaces/sandbox/tree/master/bootstrap">providing a set</a> of first-class JSF components built using these Bootstrap widgets via the RichFaces CDK.

This is still early days for the effort, consider what we have so far as a Proof of Concept. The work is being done in the <a href="https://community.jboss.org/wiki/RichFaces4ComponentDevelopmentProcess">RichFaces Sandbox</a>, where new ideas/components are explored and proven before migrating in the the framework core. We'll explore how to bring these Bootstrap components into the framework proper when the effort is complete. The reason for this blog post is to let people know what the community is doing and invite people to <a href="https://community.jboss.org/wiki/ContributorGettingStartedGuide">get involved</a>!

Take a look at the <a href="http://bootstrap-richfaces.rhcloud.com/">RichFaces bootstrap demo</a> to see what the components look like. Keep in mind we used the <a href="https://github.com/richfaces/sandbox/tree/master/bootstrap">RichFaces bootstrap JSF components</a> to build the demo itself, (a dogfood demo if you will!). So far we've stubbed out a number of bootstrap components with the CDK, and we have a bootstrap "enabled" commandButton component (build on top of the robust a4j:commandButton). 

Some example bootstrap components that I particularly like are:

h3. b:buttonDropdown

The <a href="http://bootstrap-richfaces.rhcloud.com/component/buttonDropdown/index.jsf">buttonDropdown</a> can be used to provide alternate actions for a button on your page:

div=. "!/images/blog/2012-05-04-richfaces-bootstrap/buttonDropdown.png!":/images/blog/2012-05-04-richfaces-bootstrap/buttonDropdown.png

h3. b:gridContainer

The bootstrap <a href="http://bootstrap-richfaces.rhcloud.com/component/grid/index.jsf">grid components</a> (gridContainer/gridRow/gridColumn) provide a powerful means to layout your page. Being proper JSF components, they are also valid JSF execute/render targets.

div=. <a href="/images/blog/2012-05-04-richfaces-bootstrap/gridContainer.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="235" src="/images/blog/2012-05-04-richfaces-bootstrap/gridContainer.png" width="640" /></a>

I'll blog more about the individual components as they get fleshed out. There's a ton of blog material here!

h2. RichFaces Bootstrap Roadmap

Our roadmap for these bootstrap components moving forward involves:

# <a href="https://issues.jboss.org/browse/RFSBOX-7">RFSBOX-7</a> Finish wrapping the remaining bootstrap components
# <a href="https://issues.jboss.org/browse/RFSBOX-8">RFSBOX-8</a> Flesh out the attributes of the already wrapped components
# <a href="https://issues.jboss.org/browse/RFSBOX-9">RFSBOX-9</a> Couple the widget events into the RichFaces/JSF event subsytem (eg. for enabling JSF behaviours)
# Migrate/wrap (or re-implement if required) the existing RF 4 components

The task is big, and we could use your commits! So if you are interested in either RichFaces, Bootstrap, or both - be sure to drop by #richfaces on IRC (freenode.net) to discuss how you can <a href="https://community.jboss.org/wiki/ContributorGettingStartedGuide">get involved</a> and influence how these components will shape up!

Concurrent to the work we do in our sandbox, we are still very much focused on improving the current set of RichFaces 4 components. We have another <a href="https://issues.jboss.org/browse/RF/fixforversion/12319519">4.2 micro release</a> coming out soon, and are planning the Milestone releases for the 4.3 release train.

Lastly, I'd like to close with a big shoutout to <a href="http://pauldijou.fr/">Paul Dijou</a>, a Richfaces community member who has been instrumental in getting this effort off the ground! Thanks Paul, and keep those pull request coming!