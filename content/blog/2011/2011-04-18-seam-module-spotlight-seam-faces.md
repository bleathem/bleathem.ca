---
  title: "Seam Module Spotlight: Seam Faces"
  date: 2011-04-18
  author: Brian Leathem
  categories: [Java EE, Seam]
  tags: [ Seam ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2011-04-18-seam-module-spotlight-seam-faces
  disqus_title: seam-module-spotlight-seam-faces
  disqus_url: http://blog.bleathem.ca/2011/04/seam-module-spotlight-seam-faces.html
  aliases:
    - /blog/2011/04/seam-module-spotlight-seam-faces.html
---

This is a blog entry I wrote for <a href="http://in.relation.to/Bloggers/SeamFaces301FinalReleaseAndFacesModuleSpotlight">in.relation.to</a>.  I'm including it here to keep a personal record of the post.

----

In this entry for the Seam Module Spotlight series, we will take a close look at the “view configuration” feature of Seam Faces.

Seam Faces aims to provide JSF developers with a truly worthy framework for web development by ironing out some of JSF’s pain points, integrating tightly with CDI, and offering out of the box integration with the other Seam Modules and third party libraries.  Part of achieving this goal involves providing a means to centrally configure each of these seemingly disparate concerns, without having to create any JSF Phase listeners, nor maintain a bunch XML files.

Adhering to the CDI core tenet of type safety, Seam Faces offers a type-safe mechanism to configure the behaviour of your JSF views.  So far these configurable behaviors include:

* Restricting view access by integrating with Seam Security
* Configuring URL rewriting by integrating with PrettyFaces (or any other pluggable URL rewriting framework)
* Configuring Transactions via Seam Persistence
* And a personal favorite: setting “?faces-redirect=true” when navigating to a view.

Note: the above integrations are optional, you must include the relevant jars in the application for their respective configurations to have any effect

Lets take a closer look at the View configuration from the Seam Faces example “faces-viewconfig”:

```java
@ViewConfig
public interface Pages {

  static enum Pages1 {

      @ViewPattern("/admin.xhtml")
      @Admin
      ADMIN,

      @ViewPattern("/item.xhtml")
      @UrlMapping(pattern="/item/\#{id}/")
      @Owner
      ITEM,

      @ViewPattern("/*")
      @FacesRedirect
      @AccessDeniedView("/list.xhtml")
      @LoginView("/login.xhtml")
      ALL;

  }
}
```

At first glance, the structure of the above configuration might appear odd.  The @ViewConfig annotation is on the interface, and the interface is nothing more than a container for a static enum.  This arrangement is unfortunately required by the current CDI specification for the view configuration annotations to be scanned, and will hopefully be corrected in future iterations of the CDI spec.

The properties of the enum are annotated with a @ViewPattern annotation, specifying to which views the adjacent annotations apply.  ViewPatterns support wildcards, and matches are made to a particular view weighted by the specificity of the match; therefore, if two annotations paired with different @ViewPatterns conflict for a given view, the annotation paired with the more specific @ViewPattern takes precedence.

## Seam Security via the @ViewConfig

Now let’s look at the Seam Security annotations @Admin and @Owner.  These annotations are user-provided, meaning they were built solely for this example, and are qualified with the Seam Security qualifier: @SecurityBindingType.  When a view is requested that matches a pattern in the @ViewConfig annotated with such an annotation, Seam Faces invokes Seam Security to determine if access should be granted. Authorization is evaluated with the following class:

```java
public class SecurityRules {
public @Secures @Owner boolean ownerChecker(Identity identity, @Current Item item) {
if (item == null || identity.getUser() == null) {
return false;
} else {
return item.getOwner().equals(identity.getUser().getId());
}
}

public @Secures @Admin boolean adminChecker(Identity identity) {
if (identity.getUser() == null) {
return false;
} else {
return "admin".equals(identity.getUser().getId());
}
}
}
```

In this way, views annotated with the @Owner annotation are secured by the @Secures method annotated with the same @Owner annotation.  Coupled with parameter injection, this is truly a declarative syntax for securing view access.

Furthermore, the @Admin annotation is defined with an additional qualifier:

```java
@RestrictAtPhase(PhaseIdType.RESTORE_VIEW)
```

This annotation causes the security restriction to be applied at the “Restore View” phase, rather than the default phases: “Invoke Application” and “Render Response”.  These default phases were chosen in order for application data to be present and allow access restrictions to be contextual.  The default phases also mean that the security restrictions are evaluated twice per lifecycle, as the view often changes at the end of the “Invoke Application” phase.

## URL rewriting via the @ViewConfig

The view config also let’s us configure URL rewriting for a view using the @UrlMapping annotation.  In the above @ViewConfig, the URL /item.jsf?item =1 would get mapped into /item/1/, courtesy of PrettyFaces and the annotation: @UrlMapping(“/item/\#{id}”).  In this mapping, “\#{id}” tells the rewriting-engine to treat the last portion of the URL as the value of the the query-parameter named “id”.  By integrating the configuration of rewriting URLs alongside the rest of the view configuration, Seam Faces attempts to make this powerful technology more accessible, and a core part of JSF application development.

## Setting faces-redirect=true

A seemingly simple annotation, @FacesRedirect is a surprisingly useful one.  When this annotation is present with a @ViewPattern, any navigation to a matching view is intercepted, and the faces-redirect attribute is activated.  In the provided example the @FacesRedirect annotation is applied once to the pattern “/*”, which applies the configuration to all views.  One could optionally override this catch all setting on a more specific pattern, or on an individual view, with the annotation @FacesRedirect(false).  This annotation has a special place close to my heart - no more “?faces-redirect=true” peppered throughout any more applications!

## Seam Persistence via the @ViewConfig

Last, but not least, there is the SeamManagedTransaction annotation that can be applied in the @ViewConfig.  This allows transactional behaviour to be defined on a per view basis.  Exploring the possibilities here will be the subject matter for a subsequent post.

The future for the @ViewConfig component of Seam Faces is bright, with many more capabilities to be added.  In addition, the @ViewConfig presented here is merely a front-end to an internal store of the view configuration data.  This opens up the possibility of providing alternate means of populating the view config data store, writing extensions to perform custom operations on view config data for your individual application, and more.  One solution being explored is to introduce child tags to the f:metadata tag, which will allow view related concerns to be defined from within the view itself.  Additionally, configuration sources like xml and database persistence could be incorporated to provide developers with more options.

Seam Faces provides a centralised, type safe way of configuring the behaviour of your JSF views.  Try the ViewConfig  out and be sure to send in your feedback.  This is still early days for the feature, and all feedback is very much appreciated!
