---
  title: JSF Validation Failed Notice
  date: 2010-06-25
  author: Brian Leathem
  categories: [Java EE]
  tags: [ JSF, validation ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  aliases:
    - /blog/2010/06/jsf-validation-failed-notice.html
---

Here's how I show a notice on a JSF 2 page indicating that the JSF 2 postback failed due to validation errors.  The following facelet snippet is rendered only when validation fails:

```html
<h:outputtext
   styleclass="errorMessage globalMessage"
   value="Request *not* saved due to input errors"
   rendered="\#{facesContext.validationFailed}" />
```

The user then knows they should look through the page to correct the individually marked validation failures.
