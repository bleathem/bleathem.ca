---
  title: Updating Weld in Glassfish 3.1
  date: 2011-02-16
  author: Brian Leathem
  categories: [Java EE]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2011-02-16-updating-weld-in-glassfish-31
  disqus_title: updating-weld-in-glassfish-31
  disqus_url: http://blog.bleathem.ca/2011/02/updating-weld-in-glassfish-31.html
  aliases:
    - /blog/2011/02/updating-weld-in-glassfish-31.html
---

Like any piece of software, <a href="http://seamframework.org/Weld">Weld</a>, the reference implementation for <a href="http://jcp.org/en/jsr/detail?id=299">JSR-299</a>, is continually improving as bugs are discovered, and performance is optimized.  However, since Weld is tightly coupled with your application server of choice, using the latest weld is slightly more complicated than just bundling a weld release with your web application.  This post outlines the relatively painless process of updating the Weld implementation of Glassfish 3.1 to use the latest SNAPSHOT, or any later release for that matter.

A quick search of the Glassfish folder structure identifies the Weld implementation:

```bash
$ find /opt/sun/glassfish/ -iname '*weld*'
/opt/sun/glassfish/glassfish/modules/weld-integration-fragment.jar
/opt/sun/glassfish/glassfish/modules/weld-integration.jar
/opt/sun/glassfish/glassfish/modules/weld-osgi-bundle.jar
```

The weld-osgi-bundle.jar is the file we have to replace.  But how does one go about creating such an OSGI bundle?  I for one am not an OSGI expert, and I'm sure I'm not alone :P

<hr/>

Update: The Weld OSGI bundle is now published to the maven repository.  Instead of building it yourself, you can download it via:

<a href="https://repository.jboss.org/nexus/content/repositories/snapshots/org/jboss/weld/weld-osgi-bundle/1.1.0-SNAPSHOT/">https://repository.jboss.org/nexus/content/repositories/snapshots/org/jboss/weld/weld-osgi-bundle/1.1.0-SNAPSHOT/</a>

<hr/>

Not to worry, the weld guys have this in hand.  The OSGI bundle is built as an artifact during the weld build.  To begin, proceed to the<a href="https://github.com/weld/core"> Weld core github page</a>,  and checkout the project:

```bash
git clone https://github.com/weld/core.git
cd core
```

I had a bit of trouble building the entire project, due to the requirement of some <a href="http://community.jboss.org/wiki/MavenGettingStarted-Developers">deprecated artifacts</a>.  So just build the impl module in core:

```bash
mvn clean install
```

Next, build the OSGI bundle:

```bash
cd ../bundles/osgi/
mvn clean install
```

Now take that newly created Weld OSGI bundle, and use it to replace the Glassfish weld-osgi-bundle.jar file we located earlier.

```bash
cp target/weld-osgi-bundle-1.1.0-SNAPSHOT.jar /opt/sun/glassfish/glassfish/modules/weld-osgi-bundle.jar
```

Restart Glassfish, and you should see a message in the log file along the lines of:

```bash
INFO: Updated bundle 75 from /opt/sun/glassfish-3.1-b41/glassfish/modules/weld-osgi-bundle.jar
```

And there you have it, Glassfish 3.1 running with the latest Weld.  Thanks to Stuart Douglas who guided me through the process!

Note: this will not work to get Weld 1.1+ to run on Glassfish 3.0.1, as the interface between Glassfish and Weld changed considerably with Weld 1.1/Glassfish 3.1.  However that interface is for the most part stable, so we can use newer releases of Weld on Glassfish 3.1.
