---
layout: post
title: "ViewAccessScope - why it's useful"
---

At first the conversation scope introduced with CDI seemed like it would be incredibly useful.  Unfortunately, working with conversations ended up being more difficult than expected.  Details of why this is, is fodder for another post.

I ended up often using the JSF ViewScope, exposed as a CDI scope though the <a href="http://seamframework.org/Seam3/FacesModule">Seam Faces</a> CDI extension.  When used in conjunction with JSF viewParams to propagate information between pages, the result is a book-markable end user experience.

The problem with this is that the "business conversation" is now restricted to a single page.  JSF components that provide a tabbed interfaces allow one to pack a lot into a single page, in a clear and structured way, but there are times when it just makes more sense to navigate to a new page (or view in JSF speak).

This is where the <a href="https://cwiki.apache.org/confluence/display/EXTCDI/Conversations">ViewAccessScope</a> comes in.  It's a scope defined in MyFaces CODI (a CDI extension).  The ViewAccessScope is like a long-lived conversation, where the conversation ends as soon as you use a view that does not reference the ViewAccessScoped bean.

The pattern I see as being incredibly useful, is to initiate a "business conversation" by passing viewParams to a page, then navigate through appropriate views to complete the process.  When we come to a page that no longer references the ViewAccessScoped bean, the business conversation is over.  This is a perfect fit with how I think of structuring my apps.

Now to try it out, and see how well it works!
