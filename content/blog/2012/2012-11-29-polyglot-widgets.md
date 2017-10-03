---
  title: "Polyglot Widgets"
  date: 2012-11-29
  author: Brian Leathem
  categories: [Java EE, RichFaces, Javascript]
  tags: [ Bootstrap, RichFaces, JSF, Errai, GWT, CDI, javascript, jQuery, widgets ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2012-11-29-polyglot-widgets
  disqus_title: polyglot-widgets
  disqus_url: http://blog.bleathem.ca/2012/11/polyglot-widgets.html
  aliases:
    - /blog/2012/11/polyglot-widgets.html
---

{{< figure src="/img/blog/2012-11-26-polyglot-widgets/jdf.png" title="JBoss Developer Framework" link="http:/http://www.jboss.org/jdf/" >}}

The [JBoss JDF project](http:/http://www.jboss.org/jdf/) shows Java EE developers how to build state-of-the-art applications using the JBoss implementations of the Java EE stack. Specifically, the JDF [View Frameworks](http://www.jboss.org/developer/features/frameworks.html) section identifies a number of alternative approaches one can take when developing the view layer of your application. We in the [RichFaces project](http://richfaces.org) have been working towards better supporting this effort by [redesigning our JSF component architecture](https://community.jboss.org/message/646774#646774) to allow the javascript part of our components (what we call our "widgets") to be used independent of JSF, either in a standalone manner or coupled with another web framework.

By isolating the client-behaviour into widgets, we are able to achieve both a faster turnaround on new JSF component development, while at the same time enabling users to achieve a uniform look and feel in their heterogeneous application environments. To demonstrate the impact of this, I've prepared a demo application that demonstrates using our standalone javascript widgets in JSF with [RichFaces](http://richfaces.org), GWT with [Errai](http://www.jboss.org/errai), and a plain HTML 5 page with [Aerogear](http://aerogear.org/).

Polyglot widgets demo
---------------------

![polyglot-widgets](/images/blog/2012-11-26-polyglot-widgets/polyglot-widgets.png "polyglot-widgets"):http://polyglotwidgets-richfaces.rhcloud.com/

The [polyglot-widgets demo](http://polyglotwidgets-richfaces.rhcloud.com/) takes the RichFaces Sandbox [pickList component](http://bootstrap-richfaces.rhcloud.com/component/pickList/index.jsf) and builds a GWT and plain HTML5 application using the standalone javascript pickList widget.

Some key points of the demo to call out:

Consistent L&F
--------------

Imagine writing "polyglot" web applications with both a consistent Look & Feel, and access to the rich set of [enterprise-grade widgets](http://showcase.richfaces.org/) that you've come to expect from the RichFaces project. In the demo, the same [RichFaces Sandbox pickList widget](http://bootstrap-richfaces.rhcloud.com/component/pickList/index.jsf) is used in a [JSF](http://polyglotwidgets-richfaces.rhcloud.com/richfaces-bootstrap.jsf), [GWT](http://polyglotwidgets-richfaces.rhcloud.com/gwt-bootstrap.html) and [HTML 5](http://polyglotwidgets-richfaces.rhcloud.com/html5-bootstrap.html) application. The widget and the demo pages themselves use the [Bootstrap](http://twitter.github.com/bootstrap/) project for styling, which is what enables us to achieve a consistent L&amp;F across the pages backed by different web technologies. This common L&F is taken one step further to deliver a consistent user experience by using the same javascript widget implementation across all the demo pages.

CDI Programming model
---------------------

In the demo, we use the pickList component to make a selection on one of the demo pages, then click the submit button. On navigation to one of the other demo pages, you'll notice the state persisted. This demonstrates how we can leverage [CDI](http://www.jboss.org/developer/about.html) to provide a common programming model across all our web frameworks.

Integrated Ajax Push
--------------------

Open each page of the demo in a separate window to witness selection updates synchronizing the pages in real time. Taking advantage of [RichFaces push](http://showcase.richfaces.org/richfaces/component-sample.jsf?demo=push&sample=pushCdi), the [Errai CDI bus](https://github.com/mikebrock/errai-cdi), and HTML 5 Server-Sent-Events (via the [Atmosphere project](https://github.com/Atmosphere/atmosphere)) in each of the respective frameworks provides incredible power in keeping our "polyglot" web-apps in a coherent state.

Screencast
----------

I created a screencast of the demo, to make it easier to see the above points in action. Watch the [screencast](https://vimeo.com/54314451) below, then head off to [play with the demo](http://polyglotwidgets-richfaces.rhcloud.com/) yourself. Even better, [fork the demo on github](https://github.com/bleathem/polyglot-widgets), and see what cool things you can do with it.

div=. <iframe src="http://player.vimeo.com/video/54314451" width="500" height="320" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

Next Steps...
-------------

I put this demo together as a proof-of-concept to help me illustrate what I mean when I talk about "standalone widgets" and polyglot/poly-framework applications. The RichFaces team will ramp up development on these new standalone widgets as we wrap up our RichFaces 4.3 effort and shift gears into [RichFaces 5](https://community.jboss.org/thread/213160). So stay tuned for further development in this area!
