---
  title: "Dynamic Panels with a4j:repeat"
  date: 2013-01-28
  author: Brian Leathem
  categories: [Java EE]
  tags: [ RichFaces, RF43, repeat, dynamic, tab, accordion, toggle ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2013/01/dynamic-panels-with-a4jrepeat.html
---

{{< figure src="/img/blog/common/richfaces.png" title="RichFaces" link="http://richfaces.org/" >}}

With the imminent [4.3.0.Final release](https://issues.jboss.org/browse/RF/fixforversion/12320380) of RichFaces, we will be providing developers with the ability to dynamically create `<rich:togglePanel>`, `<rich:accordion>`, and `<rich:tabPanel>` panel items dynamically with the `<a4j:repeat>` tag.

`<a4j:repeat>` vs. `<c:forEach>`
--------------------------------

Creating the above panels from a backing bean list has always been possible with RichFaces 4 using the [JSTL `<c:forEach>`](http://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/c/forEach.html) tag, so why have we bothered adding support for creating such panels with the [`<a4j:repeat>`](http://docs.jboss.org/richfaces/latest_4_X/vdldoc/a4j/repeat.html) tag? The answer to that requires an understanding of when the JSTL tags are evaluated during the creation of the JSF component tree, and subsequent page render:

<div class="alert alert-info">
**TL;DR:** JSTL tags are evaluated during the compilation of the Facelet, during the construction of the component tree, whereas `<a4j:repeat>` is evaluated during the render phase of the JSF life-cycle.

For a great/detailed explanation of the JSTL tag / Life-cycle interaction, I'll refer you to [this blog post](http://www.znetdevelopment.com/blogs/2008/10/18/jstl-with-jsffacelets/).

</div>
So if you are currently using the `<c:forEach>` tag to define dynamic child toggle panel items, and are noticing an issue on post-back when the list backing the panel items may have changed, be sure to try using the <a4j:repeat> tag instead.

Using the `<a4j:repeat>`
------------------------

Refer to the [showcase snapshot](http://showcase-latest.richfaces.org/) for examples of using the `<a4j:repeat>` tag with the above listed family of toggle panel items:

-   [`<rich:togglePanel>`](http://showcase-latest.richfaces.org/richfaces/component-sample.jsf?demo=togglePanel&sample=dynamic)
-   [`<rich:tabPanel>`](http://showcase-latest.richfaces.org/richfaces/component-sample.jsf?demo=tabPanel&sample=dynamic)
-   [`<rich:accordion>`](http://showcase-latest.richfaces.org/richfaces/component-sample.jsf?demo=accordion&sample=dynamic)

The 4.3 release
---------------

RichFaces [4.3.0.CR2](http://www.bleathem.ca/blog/2013/01/richfaces-430cr2-release-announcement.html) is currently available, and RichFaces 4.3.0.Final will be available shortly. Please take the time to take try out the `<a4j:repeat>` tag to define relating toggle panel items, and give us your feedback for the new features and bug fixes via the [RichFaces forum](https://community.jboss.org/en/richfaces?view=discussions) or [issue tracker](https://issues.jboss.org/browse/RF).
