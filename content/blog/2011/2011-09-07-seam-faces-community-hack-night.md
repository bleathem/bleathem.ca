---
  title: "Seam Faces Community Hack Night"
  date: 2011-09-07
  author: Brian Leathem
  categories: [Java EE, Seam]
  tags: [ Seam, Community ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2011-09-07-seam-faces-community-hack-night
  disqus_title: seam-faces-community-hack-night
  disqus_url: http://blog.bleathem.ca/2011/09/seam-faces-community-hack-night.html
  aliases:
    - /blog/2011/09/seam-faces-community-hack-night.html
---

This week's <a href="http://seamframework.org/Seam3">Seam 3</a> Community hack night is centered around <a href="http://seamframework.org/Seam3/FacesModule">Seam Faces</a>.  This is a great chance to mingle with some CDI/JSF developers on <a href="http://seamframework.org/Seam3/Chat">IRC</a>, and get your fingerprint into the Seam Faces DNA!  Whether you have your own itch you want to scratch, a long-standing bug you want to see resolved, or implement a new feature altogether, we've got plenty of low hanging fruit ripe for the picking!

In preparation for the hack-a-thon, I've given the Seam Faces JIRA issues a once-over.  I've collected a number of issues that I feel are ready to be resolved into a JIRA version calles <a href="https://issues.jboss.org/browse/SEAMFACES/fixforversion/12318074">3.1.0-Tracking</a>.  I'd like to highlight a few of the issues here, and perhaps motivate you to come join us at the hack-a-thon to resolve some of them!

**<a href="https://issues.jboss.org/browse/SEAMFACES-122">SEAMFACES-122</a>: Type safe navigation!**

Of all the low-hanging fruit, this one has to be the juiciest!  Implement a Navigator utility class to map the @ViewConfig enums to their String @ViewPattern's for use in JSF navigation.  Imagine using your IDE to find all usages of one of your views - type safety FTW!

**<a href="https://issues.jboss.org/browse/SEAMFACES-26">SEAMFACES-26</a>: Implement global protection against XSRF attacks**

Help the community of Seam 3 developers make their apps more secure by implementing a scheme to protect against XSRF attacks!  Think hidden form field, view state and a random number generator.

**<a href="https://issues.jboss.org/browse/SEAMFACES-28">SEAMFACES-28</a>: ObjectConverter and EntityConverter**

Let's resurrect the Entity Converter from Seam 2.  The EntityConverter is persistent context aware, and will use the primary key of your JPA/Hibernate entities to handle JSF Conversion.

**<a href="https://issues.jboss.org/browse/SEAMFACES-150">SEAMFACES-150</a>: Refactor BeanManagerUtils to make use of Solder's BeanManagerLocator**

Are you aware with the Seam Solder API?  Want to learn more about how to wield this powerful tool?  Here's a refactoring that will surely get you more comfortable with how to use Solder.

**<a href="https://issues.jboss.org/browse/SEAMFACES-6">SEAMFACES-6</a>: s:debug**

This issue is very well documented in JIRA, and just needs someone to put the pieces together.  What a great tool to add to your arsenal once complete!

**<a href="https://issues.jboss.org/browse/SEAMFACES-185">SEAMFACES-185</a>: Add support for activating beans based on the JSF project stage**

<a href="http://community.jboss.org/people/chkal">Christian Kaltepoth</a> has done a great job with this issue, but we've got a tough nut to crack.  How to parse the web.xml before the Servlet Context is available?  If you got some ideas here, help us bring this one across the finish line.

**<a href="https://issues.jboss.org/browse/SEAMFACES-184">SEAMFACES-184</a>: Extend an example to demonstrate events propagation features**

Familiar with Seam Faces, but don't feel up to hacking on the core?  How about writing an example application, to demonstrate some of Seam Faces' cool features?

**<a href="https://issues.jboss.org/browse/SEAMFACES-152">SEAMFACES-152</a>: Create documentation for using Seam Catch in Faces**

Another great way to contribute to the project, without writing a single line of code is to contribute docs!  Help other Seam 3 devs figure out what you already know!

These are just a few of the issues ready to be solved during the hack night.  So drop by on IRC, and give us a hand squashing some issues.  At the very least, I'm sure you'll have fun!
