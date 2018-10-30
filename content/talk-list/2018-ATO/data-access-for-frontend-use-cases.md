---
type: itemized
author: Brian Leathem
date: 2018-10-22
title: Optimizing Data Access For Frontend Use Cases With A Modular Api Gateway
? description
? featured
? featuredpath
? featuredalt
categories: []
conference: 2018-ATO
slides: http://www.bleathem.ca/talks/2018-ATO/Optimizing-Data-Access-For-Frontend-Use-Cases.pdf
---

The Netflix front-end ecosystem spans a wide variety of device types and a potentially long-lived lifetime for those devices. Providing enduring and scalable API endpoints to enable rich customer experiences across such a diverse landscape poses a unique set of challenges and constraints.

In this session we will look at how we develop applications targeting use-case tailored endpoints in our API gateway. Leveraging node.js and a container-based approach, we expose customizable “bite-size” pieces of our API through application and device specific endpoints. Furthermore, by consolidating the heterogenous API protocols and semantics via a distributed JSON graph model, requests can be batched, aggregated, and optimized while providing a uniform data access model.

You will leave this session with an understanding of the penalties incurred with increasing architectural complexity, and the considerations one should undertake when implementing your own solutions.
