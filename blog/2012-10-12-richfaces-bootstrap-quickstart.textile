---
layout: post
title: "RichFaces Bootstrap Quickstart"
tags: [ Bootstrap, RichFaces, quickstart ]
---

I'm excited about the buzz the "RichFaces Bootstrap":http://www.bleathem.ca/blog/2012/05/richfaces-bootstrap.html sandbox initiative "is generating":http://pauldijou.fr/blog/2012/08/07/news-richfaces-bootstrap/.  It's also exciting to see other projects offer a bootstrap style/theme.  This can only help inter-op and component compatibility, marking life easier for all JSF developers.  This post is meant to help those looking to build a custom application using the RichFaces Bootstrap components.

Along with the "new approach we are taking":https://community.jboss.org/thread/199693 in the development of these new components, the RichFaces project is incorporating a new "LESS":http://lesscss.org/ based approach to style/themes.  With LESS we can take advantage of dynamic features such as variables, mixins, operations and functions.  However, this requires us to make some changes to "how we serve resources":https://issues.jboss.org/browse/RFSBOX-42 and is still in active development as we work through various prototypes in the RichFaces Sandbox.

h2. The RichFaces Bootstrap Quickstart

We've added a "RichFaces Bootstrap Quickstart":https://github.com/richfaces/sandbox/tree/master/bootstrap/quickstart project that you can use to build an application to test-drive these new components.  This quickstart application has the sole intention of being a starting point, and is much simpler to grok than the demo application we've been providing that is more of a component showcase.  As an added bonus, creating this quickstart served as a good driver to simplify the RichFaces bootstrap-ui project, making it easier to consume.  Simplicity for-the-win!

div(alert alert-info). Rest assured the complexity of this approach will ultimately disappear and usage of these components will become transparent as we move out of the prototyping stage and include these components in "RichFaces proper".

h2. A walk-through the Quickstart

The RichFaces Bootstrap quickstart is a maven project "available on github":https://github.com/richfaces/sandbox/tree/master/bootstrap/quickstart in the RichFaces Sandbox repository.  It includes the appropriate configuration in the web.xml deployment descriptor that, when coupled with a resource mapping file, allows us to activate the client-side LESS styling of the RichFaces Bootstrap components.

If you are not interested in working with the client-side LESS styling, but rather the CSS compiled at build time, then simply build the quickstart project as is:

bc. mvn clean install

However, should you wish to work with the LESS approach to styling, change the @org.richfaces.clientSideStyle@ context-param in the web.xml to @true@:

bc. <context-param>
    <param-name>org.richfaces.clientSideStyle</param-name>
    <param-value>true</param-value>
    <!-- Note this will be overridden by PROJECT_STAGE = Production -->
</context-param>

You can then include your own @.less@ files and they will be converted to CSS on the client-side with the provided less.js library.  You will then want to convert your LESS files to CSS (at build time) when you go to production, but that will be the topic of another blog (or look at how we've done it with "wro4j":http://code.google.com/p/wro4j/ in the "bootstrap-ui":https://github.com/richfaces/sandbox/tree/master/bootstrap/ui project).

We're planning on pushing heavily on LESS/JSF integration in the coming few months, looking to simplify the process, and enable you to take advantage of the "many LESS/Bootstrap themes available":https://www.google.ca/search?q=bootstrap+themes and apply them to your application.  We'll keep the "README" of the quickstart up-to-date with any changes required to consume the components in your own projects.

div(alert alert-error). *Disclaimer*: RichFaces Bootstrap is a Sandbox project, and _not yet_ meant for production use.  API's and component implementations will change.