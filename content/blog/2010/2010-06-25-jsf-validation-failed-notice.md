---
layout: post
title: "JSF Validation Failed Notice"
tags: [ jsf2, JSF, validation ]
---

Here's how I show a notice on a JSF 2 page indicating that the JSF 2 postback failed due to validation errors.  The following facelet snippet is rendered only when validation fails:

<pre class="prettyprint">
<h:outputtext 
   styleclass="errorMessage globalMessage" 
   value="Request *not* saved due to input errors" 
   rendered="\#{facesContext.validationFailed}" />
</pre>

The user then knows they should look through the page to correct the individually marked validation failures.
