---
type: itemized
author: Brian Leathem
date: 2013-06-05
title: Poly-framework Web applications with Java EE
description: Writing Poly-framework Web applications with Java EE and CDI
featured:
featuredpath:
featuredalt:
categories: []
conference: 2013-JAXconf
slides: http://www.bleathem.ca/talks/2013-JAX/polyframework-webapps.html
video: https://www.youtube.com/watch?v=x7P6CTqSOis
---

A significant impediment in considering the shift to a new web technology is the question of how to best manage the existing investment in your applications while taking advantage of the improvements offered by new web development approaches. The good news is a full rewrite of your web UI is not the only answer! You can successfully deliver a “poly-framework” web application implemented with multiple web frameworks while preserving a consistent experience for your end-users. In this session we will look at approaches you can take in both the front and back-ends of your polyglot web applications to achieve an architecture that allows for a seamless use of multiple web frameworks. By adopting a comprehensive and consistent styling approach like that provided by the Bootstrap project on your front-end, one can present the user with a consistent L&F regardless of the server-side technology backing their current view of the application. Analogously, CDI provides a consistent programming model on the back-end, allowing web frameworks to interoperate through the CDI events mechanism, with a unified server state. We'll look specifically at techniques to develop a JSF/RichFaces, GWT/Errai, and HTML5+JavaScript/Aerogear application with a unified CDI backend, and interop provided on the server. We’ll look at how clients' pages in each of these frameworks can respond to asynchronous server-sent events, even going so far as to enable multiple web technologies within a single page. Brian Leathem is the RichFaces project lead and represents Red Hat on the JSF EG. The material he covers in this session will leave you equipped to provide your users with a consistent look and feel in applications that span multiple web-framework technologies. You will be able to migrate your existing applications to newer more modern frameworks.
