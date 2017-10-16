---
type: itemized
author: Brian Leathem
date: 2016-06-29
title: Write Powerful JavaScript Modules to Make Your Apps Dry
description:
featured:
featuredpath:
featuredalt:
categories: []
conference: 2016-DevNation
slides: https://www.slideshare.net/RedHatDevelopers/write-powerful-javascript-modules-to-make-your-apps-dry-brian-leathem
pdf: http://www.bleathem.ca/talks/2016-DevNation/write-powerful-javascript-modules-to-make-your-apps-dry.pdf
video: https://www.youtube.com/watch?v=ATcfEwp55Qs
---
Large-scale Javascript applications benefit from a modular approach that let code be reused both within the application and across repeated implementations. In this session, we'll look at the modular approach used to build reusable Javascript modules in the Red Hat mobile field workforce management application (WFM) showcased in this year's Summit middleware keynote demo. Reusable modules for WFM are packaged as node package manager (npm) modules, providing a consistent format for both server and client sides using Node.js and Browserify. Modules are loosely coupled using the Mediator pattern and they broadcast user actions and state changes giving the application and other modules the opportunity to hook into those events. Additionally, visual components are packaged in a framework-agnostic manner, providing reusable UI components. You'll leave this session understanding the challenges faced when building reusable modules for large-scale applications, and the solutions employed in building out the reusable WFM modules.
