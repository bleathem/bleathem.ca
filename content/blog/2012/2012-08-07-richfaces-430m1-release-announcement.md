---
  title: "RichFaces 4.3.0.M1 Release Announcement"
  date: 2012-08-07
  author: Brian Leathem
  categories: [Java EE, RichFaces]
  tags: [ RichFaces, RF43, CDK, testing, MyFaces ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2012/08/richfaces-430m1-release-announcement.html
---

{{< figure src="/img/blog/common/richfaces.png" title="RichFaces" link="http://richfaces.org/" >}}

The first milestone release of RichFaces 4.3 ([4.3.0.M1](https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12318553)) is now available.  This is a significant release, with primary focus on improving the RichFaces Component Development Kit ([CDK](https://community.jboss.org/wiki/RichFacesCDKHowTos)) - the tool we use to author our JSF components.  A second goal of the release was to improve our "MyFaces":http://myfaces.apache.org/ support, which we accomplished by fixing a number of issues, and identifying some further issues to be addressed in a subsequent 4.3 milestone release.

div(alert alert-info). *To try out this release:* You can download the distribution "directly":http://www.jboss.org/richfaces/download/milestones, or for maven users, increment the RichFaces version in your pom.xml to 4.3.0.20120802-M1. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

h2. CDK Improvements

RichFaces Component Development Kit ("CDK":https://community.jboss.org/wiki/RichFacesCDKHowTos) is a heavy-lifter in the RichFaces Framework.  The CDK is the tool we use to author our JSF components.  Improvements we make to the CDK improve our ability to deliver components, and will reduce our "turnaround":http://rik-ansikter.blogspot.ca/2012/03/incredibly-fast-jsf-component.html on delivering new features for developing web applications.

RichFaces developer "Paul Dijou":https://community.jboss.org/people/paul.dijou has written up a "great summary":http://pauldijou.fr/blog/2012/08/01/news-richfaces-cdk/ of the recent CDK improvements.  For further details on what has changed, you can refer to the list of individual "issues addressed":https://issues.jboss.org/secure/IssueNavigator.jspa?reset=true&jqlQuery=project+%3D+RF+AND+fixVersion+%3D+%224.3.0.Milestone1%22+AND+status+%21%3D+Open+and+labels+%3D+%27MyFaces%27+ORDER+BY+priority+DESC.  While the bulk of CDK changes have landed in M1, we will undoubtedly introduce further improvements throughout the rest of the 4.3 release cycle as we push the boundaries on what's possible with the CDK in our "RichFaces Bootstrap":http://bootstrap-richfaces.rhcloud.com/ sandbox project.

h2. "Real" Tests

Testing of our components and framework has always been a primary concern of the RichFaces project.  All our releases to date have been tested not only with unit tests, but also with a large battery of significant number of "functional tests":https://github.com/richfaces/qa.  However, functional tests treat the JSF servlet as a black box - we know what we put it and we can test what comes out.  On the other hand, unit tests mock the environment where our implementation runs, hiding any issues that would occur only in a real environment.  If you think about it, these tests operate in a blind-folded manner: what's happening as the container executes our application logic?

To this end, the RichFaces project has co-ordinated with the "Arquillian":http://aqruillian.org project in the development of a new extension: ""Arquillian Warp":http://arquillian.org/blog/2012/05/27/arquillian-extension-warp-1-0-0-Alpha1/".  With Warp, we can write tests that assert state simultaneously on both the client and the server.  For JSF, this means our tests can assert state at arbitrary points throughout the JSF lifecycle.  As you can imagine, this opens up a whole new category of tests we can write, as we can not only assert that our application logic has the desired effect, but also that it executes as we expect.

Warp reuses outstanding Arquillian integration with various containers, which allows us to test the integration of RichFaces with many application servers and servlet containers. Furthermore, Warp leverages the "Arquillian Drone":http://www.arquillian.org/extensions/drone/ extension for running Selenium-based tests. Arquillian's flexibility together with Drone's ability to drive both real and mocked browsers (ie. HtmlUnit), allows us to run tests using minimal resources in continuous integration, and we can run those same tests in "real" environments to verify integration with many real containers.

Our integration tests makes heavy use of "ShrinkWrap":http://www.jboss.org/shrinkwrap/ to create _micro-deployments_ allowing us to separate the project into small testable pieces. ShrinkWrap Resolvers provides support for resolving various modules from our multi-module project, while ShrinkWrap Descriptors allows us to programatically describe configuration files (like faces-config.xml and web.xml), property files, and Facelet files - which enable us to write tests once and run them in many different configurations.

So far we've used this new capability within the framework to harden our RichFaces Push and Resource Mapping implementation, and we will continue to develop new cross-container integration tests of our components and frameworks to complement our already impressive test suite.

h2. Issue highlights

This milestone release addresses a number of bugs as well as new features.  For a full list of issues addressed, be sure to check out the "Release Notes":https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12318553.  However, there are a couple of issues I would like to call out in this blog.

The "*rich:jQuery*":https://issues.jboss.org/browse/RF-12328 function in EL to call a jQuery object from a JSF id as in:
<code>\#{rich:jquery('your-id']}</code>

This is a convenience method introduced as a short-hand for the current:
<code>$('#\#{rich:clientId('your-id')}')</code>

The RichFaces "*a4j:push*":http://showcase.richfaces.org/richfaces/component-sample.jsf?demo=push feature now has a "max inactive timeout":https://issues.jboss.org/browse/RF-12370, that specifies the maximum amount of time a session is allowed to be inactive.  This is an experimental feature, put in place as a workaround while we resolve the underlying issue "RF-12219":https://issues.jboss.org/browse/RF-12219.  Try it out, let us know what you think!

h2. Component Upgrades

The RichFaces project is very much an open source project, and leverages other open source projects wherever possible.  In this milestone release, we updated the version dependency of some of our upstream projects.  These include:

* ["RF-12176":https://issues.jboss.org/browse/RF-12176] - Upgrade to Atmosphere 1.0.0.beta4
* ["RF-12334":https://issues.jboss.org/browse/RF-12334] - Upgrade Mojarra to 2.1.7
* ["RF-12335":https://issues.jboss.org/browse/RF-12335] - Upgrade MyFaces to 2.1.8
* ["RF-12336":https://issues.jboss.org/browse/RF-12336] - Upgrade jQuery to 1.7.2
* ["RF-12371":https://issues.jboss.org/browse/RF-12371] - Upgrade Maven project dependency to 3.0.4

h2. MyFaces Issues

With this release, we've also turned our attention to a number of "MyFaces":http://myfaces.apache.org/ issues that we hadn't addressed with our recent releases.  In order to co-ordinate with the "JBoss EAP 6":http://gb.redhat.com/products/jbossenterprisemiddleware/application-platform/ release, we focused predominantly on "Mojarra":http://java.net/projects/mojarra/ compatibility.  However RichFaces is a container agnostic project, and we're making a concerted effort to improve our MyFaces compatibility with our 4.3 release.

This effort is being facilitated both by the "Arquillian Warp":http://arquillian.org/modules/warp-extension/ project mentioned above, as well as by the "TomEE":http://openejb.apache.org/apache-tomee.html project.  TomEE gives us an excellent pre-bundled/pre-configured Tomcat and MyFaces environment against which we can both develop and debug our components - without requiring us to assemble the required jars, and "roll our own appserver".

As with our CDK improvements, fixing MyFaces issues will continue throughout the 4.3 release.  M1 is just a first step in this direction.

h2. What's Next?

In a recent RichFaces "community meeting":https://community.jboss.org/wiki/RichFacesTeamMeetingAgenda2012-07-31#comment-10330, we set some goals for the M2 release of RichFaces 4.3.  These goals include:

* Restructure the build (according to the requirements being collected "in our wiki":https://community.jboss.org/wiki/RichFaces43BuildRedesign)
* Proceed with further MyFaces fixes
* Iteration/repeating issues
* Critical/Popular bugs

Also, be sure to follow the "RichFaces Bootstrap":http://bootstrap-richfaces.rhcloud.com/ project:

div(alert alert-success). In the "RichFaces Bootstrap":http://bootstrap-richfaces.rhcloud.com/ Sandbox project, we are developing our next-generation component set based on top of the "Twitter bootstrap":http://twitter.github.com/bootstrap/ project.  RichFaces developer Paul Dijou has an excellent write-up on the "latest bootstrap updates":http://pauldijou.fr/blog/2012/08/07/news-richfaces-bootstrap/.  Also, check out "JSF+LESS blog":http://rik-ansikter.blogspot.cz/2012/08/jsf-meets-skinning-awesomeness-of-less.html by RichFaces developer "Lukas Fryc":https://community.jboss.org/people/lfryc, showcasing the real-time CSS/LESS development going on in our Bootstrap project - JSF component styling at it's best!
