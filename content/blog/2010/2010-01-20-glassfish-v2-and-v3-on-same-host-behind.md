---
  title: Glassfish V2 and V3 on the same host, behind mod_jk
  date: 2010-01-20
  author: Brian Leathem
  categories: [Java EE]
  tags: [ mod_jk, JavaEE, JSF, glassfish ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2010-01-20-glassfish-v2-and-v3-on-same-host-behind
  disqus_title: glassfish-v2-and-v3-on-same-host-behind
  disqus_url: http://blog.bleathem.ca/2010/01/glassfish-v2-and-v3-on-same-host-behind.html
  aliases:
    - /blog/2010/01/glassfish-v2-and-v3-on-same-host-behind.html
---

I've jumped on the JavaEE 6 bandwagon, with one application already in production.  The developer productivity improvements in JavaEE6/Glassfish V3 are tremendous.  The only downside is that I still have some JavaEE 5 applications in production.  The JavaEE 5 apps can't migrate to JavaEE 6 until Icefaces supports JSF 1.2.

One workaround to this is to bundle the JSF 1.2 implementation with your application, then  configure the classloader using the sun-web.xml file to load this bundled JSF library instead of the container's JSF 2.0 library.  This however only works with a standalone WAR file; when the WAR is bundled in an EAR, and references other EJB-JAR's, this trick isn't possible.  Yet I still wanted to move new application development to JavaEE 6.

My solution was to run both Glassfish V2 and Glassfish V3 on the same box, with mod_jk forwarding requests to the appropriate container.  In this way I am able to keep my existing JavaEE 5 / Icefaces applications running, and deploy new applications to the JavaEE 6 environment.

The first step was to get GF v2, and GF v3 running on the same machine.  I have GF v2 running on the standard ports, and I incremented each port by 1 for GF v3.  It looks like:

|                     | GF v2 Port | GF v3 Port |
| -------------------:| ---------- | ---------- |
| HTTP                | 8080       | 8081       |
| HTTPS               | 8181       | 8182       |
| HTTP - ADMIN        | 4848       | 4849       |
| IIOP                | 3700       | 3701       |
| IIOP SSL            | 3820       | 3821       |
| IIOP SSL-MUTUALAUTH | 3920       | 3921       |
| JMX                 | 8686       | 8687       |
| JMS                 | 7676       | 7677       |

Next, we had to get mod_jk installed and working.  The glassfish support team (yes, I pay for support!) pointed me to the following resources:

* V2 instructions -  <a class="moz-txt-link-freetext" href="http://weblogs.java.net/blog/2006/03/17/running-glassfish-apache-httpd">http://weblogs.java.net/blog/2006/03/17/running-glassfish-apache-httpd</a>
* V3 instructions -  <a class="moz-txt-link-freetext" href="http://weblogs.java.net/blog/2009/06/24/running-glassfish-v3-apache-httpd">http://weblogs.java.net/blog/2009/06/24/running-glassfish-v3-apache-httpd</a>

These were a great starting point, from which I ended up with the solution.

mod_jk.conf:

```ApacheConf
#mod_jk/1.2.28
LoadModule jk_module modules/mod_jk.so
JkWorkersFile /etc/httpd/conf.d/worker.properties
# Where to put jk logs
JkLogFile /var/log/httpd/mod_jk.log
# Set the jk log level [debug/error/info]
JkLogLevel info
# Select the log format
JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "
# JkOptions indicate to send SSL KEY SIZE,
JkOptions +ForwardKeySize +ForwardURICompat -ForwardDirectories +DisableReuse
# JkRequestLogFormat set the request format
JkRequestLogFormat "%w %V %T"

# Should mod_jk send SSL information (default is On)
JkExtractSSL On
# What is the indicator for SSL (default is HTTPS)
JkHTTPSIndicator HTTPS
# What is the indicator for SSL session (default is SSL_SESSION_ID)
JkSESSIONIndicator SSL_SESSION_ID
# What is the indicator for client SSL cipher suit (default is SSL_CIPHER)
JkCIPHERIndicator SSL_CIPHER
# What is the indicator for the client SSL certificated? (default is SSL_CLIENT_CERT)
JkCERTSIndicator SSL_CLIENT_CERT

# Set the following if you want all vhosts to inherhit JkMounts from global
JkMountCopy All

# Send requests to GlassFish
JkMount /javaee6app* worker1
JkMount /javaee6app/* worker1

JkMount /javaee6app* worker2
JkMount /javaee6app/* worker2

# Send all glassfish-test requests to GlassFish
JkMount /glassfish-test/* worker1

JkShmFile /var/log/httpd/jk-runtime-status
```

And worker.properties:

```ApacheConf
## Define 1 real worker using ajp13
worker.list=worker1,worker2
# Set properties for worker1 (ajp13)
worker.worker1.type=ajp13
worker.worker1.host=localhost.localdomain
worker.worker1.port=8009
#Only used for a member worker of a load balancer.
#worker.worker1.lbfactor=50
#Do not use cachesize with values higher then 1 on Apache 2.x prefork
#worker.worker1.cachesize=10
#connection_pool_size replace cachesize as of v1.2.16
worker.worker1.connection_pool_size=1
worker.worker1.connection_pool_timeout=0
worker.worker1.socket_keepalive=1
#Socket timeout in seconds
worker.worker1.socket_timeout=60

worker.worker2.type=ajp13
worker.worker2.host=localhost.localdomain
worker.worker2.port=8010
#Only used for a member worker of a load balancer.
#worker.worker2.lbfactor=50
#Do not use cachesize with values higher then 1 on Apache 2.x prefork
#worker.worker2.cachesize=10
#connection_pool_size replace cachesize as of v1.2.16
worker.worker2.connection_pool_size=1
worker.worker2.connection_pool_timeout=0
worker.worker2.socket_keepalive=1
#Socket timeout in seconds
worker.worker2.socket_timeout=60
```

These are not the worker.properties as prescribed in the above links.  After implementing the initial solution, I got reports from the wild of users mysteriously losing sessions.  After much reading about mod_jk, I think I narrowed down the problem to a cachesize/connection_pool_size > 1 in conjunction with the prefork mpm apache module.  Apparently this is a no-no.

So with these settings in place, I am able to develop new apps in JavaEE 6, while still running my older JavaEE 5 apps, on the same box.  Looking forward to Icefaces 2.0 though, so I can drop this needless complexity!
