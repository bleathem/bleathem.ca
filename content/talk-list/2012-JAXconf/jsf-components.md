---
type: itemized
author: Brian Leathem
date: 2012-07-10
title: Leverage jQuery Plugins To Create JSF Components
description: Building JSF Components with the jQuery UI widget factory
featured:
featuredpath:
featuredalt:
categories: []
conference: 2012-JAXconf
slides: http://www.bleathem.ca/talks/2012-JAX/jsf-components.html
---

JavaServer Faces provides application developers with a visual component model for building web applications, standardized as part of the Java EE specification. Components libraries such as RichFaces abstract away the javascript details, allowing one to focus on building applications with a rich user experience without fiddling with complex javascript. However, if you want to provide your user with a rich web experience, and the functionality you need isn’t provided by an existing JSF component library, you can quite easily leverage existing javascript libraries to create your own JSF components. jQuery plugins exist providing functionality in a number of areas, including: image manipulation/galleries, social media interaction (Twitter, Youtube, etc.), page navigation, and custom animations. By wrapping these plugins as JSF components, you maintain the benefits of abstracting away the javascript in your application and encapsulating the behavior within the component. Simple use cases for custom JSF components can be achieved using the JSF 2 composite component feature. A more full-powered approach involves writing “full-fledged” JSF components, a process made dramatically easier with the RichFaces CDK. The CDK approach is based around a template file designed as an extension of a JSF 2 composite component, along with a set of java annotations. These template files and annotations are processed at build time to create the classes required to provide JSF components and renderers. Together, we’ll take a look at creating custom JSF components using both of the above techniques, and demonstrate how to take advantage of the many existing jQuery plugins, providing a rich experience in your web applications.
