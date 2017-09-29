---
layout: post
title: "Testing AS7 web apps over SSL"
---

Here's a recipe I found useful for trouble-shooting a web-app over an SSL connection. The steps involved are to:


# Set the server name/IP on each of the testing machines (both Windows and Linux)
# Create a self-signed certificate for the server using the java-based keytool
# Export the certificate for installation as a CA in the clients
# Configure JBoss AS7 to use the certificate sotre

All the above steps are sufficiently simple, but each required it's own share of googling to get everything just right. This post is as much a set of notes to myself in the future, as it is a blog

h2. 1. Setting the Server name

On your Linux testing machine, make sure the sure IP and name of your local server are in your /etc/hosts file:

<pre class="prettyprint">
127.0.1.1 bleathem-redhat bleathem-redhat.local
</pre>

Do the same thing for you windows clients - that's right! Windows has a /etc/hosts file! See this <a href="http://en.wikipedia.org/wiki/Hosts_file">wikipedia article</a> to locate the file in your version of windows.

h2. 2. Create a self-signed certificate

Use the java keytool command to create the certificate store:

<pre class="prettyprint">
keytool -genkey -alias tomcat -keyalg RSA -validity 3650 -keystore server.jks
</pre>

when asked for your "first and last name", answer with the fully-qualified domain name. For me this is __bleathem-redhat.local__.

h2. 3. Export the certificate

Export the certificate from the keystore you just created, again using the keytool command:

<pre class="prettyprint">keytool -exportcert -alias tomcat -keystore server.jks -file as7.cer</pre>

Copy this certificate to your Windows clients, and install it as a certificate authority. I found this to be necessary, as IE9 is particularly nasty about dealing with "unofficial" certificates. Steps to do this are left as an exercise for the reader! (I don't feel like taking a bunch of windows screenshots.)

h2. 4. Configure JBoss AS7

In the __standalone.xml__ configuration file of your AS7 instance, find the line:

<pre class="prettyprint">
<connector name="http" protocol="HTTP/1.1" socket-binding="http" scheme="http"/>
</pre>

And add below it the lines:

<pre class="prettyprint">
<connector name="https" protocol="HTTP/1.1" socket-binding="https" scheme="https" secure="true">
    <ssl name="https" password="changeit" certificate-key-file="standalone/configuration/server.jks"/>
</connector>
</pre>

This will configure your AS 7 instance to use your newly created certificate store on it's SSL enabled port. The default __https__ port for AS7 is 8443.

And there we have it!  A fully functional SSL/https enabled environment for testing our web apps!