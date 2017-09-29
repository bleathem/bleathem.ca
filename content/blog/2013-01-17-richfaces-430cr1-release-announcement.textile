---
layout: post
title: "RichFaces 4.3.0.CR1 Release Announcement"
tags: [ RichFaces, RF43 ]
---

!>/images/blog/common/richfaces.png(RichFaces)!:http://richfaces.org/

The first candidate release of RichFaces 4.3 ("4.3.0.CR1":https://issues.jboss.org/secure/ReleaseNote.jspa?projectId=12310341&version=12320379) has been released.  This release candidate for the RichFaces 4.3 release doesn't add any new features, rather it polishes, documents, and showcases the many new features added in the earlier 4.3 milestones ("4.3.0.M3":http://www.bleathem.ca/blog/2012/12/richfaces-430m3-release-announcement.html, "4.3.0.M2":http://www.bleathem.ca/blog/2012/10/richfaces-430m2-release-announcement.html, "4.3.0.M1":http://www.bleathem.ca/blog/2012/08/richfaces-430m1-release-announcement.html).

div(alert alert-info). *To try out this release:* You can download the distribution "directly":http://www.jboss.org/richfaces/download/milestones, or for maven users, increment the RichFaces version in your pom.xml to 4.3.0.CR1. For more information on setting up a RichFaces 4 application, refer to our<a href="http://community.jboss.org/wiki/GettingstartedwithRichFaces4x"> getting started guide</a>.

h2. Documentation updates

If you are interested in taking advantage of some of the new feature additions described in the "earlier milestone release blogs":http://www.bleathem.ca/blog/tags/RF43/, be sure to check out the updated "RichFaces 4.3.0.CR1 documentation":http://docs.jboss.org/richfaces/4.3.X/4.3.0.CR1/, and the "showcase snapshot":http://showcase-latest.richfaces.org/ which demos the latest updates to the showcase.

Some of the documentation highlights include:

* Component reference "documentation for @<rich:focus>@":http://docs.jboss.org/richfaces/4.3.X/4.3.0.CR1/Component_Reference/en-US/html_single/#sect-Component_Reference-Functionality_extension-richfocus
* Component reference "documentation for @<rich:placeholder>@":http://docs.jboss.org/richfaces/4.3.X/4.3.0.CR1/Component_Reference/en-US/html_single/#sect-Component_Reference-Functionality_extension-richplaceholder
* "Built-in sorting documentation for the @<rich:externdedDataTable>@":http://docs.jboss.org/richfaces/4.3.X/4.3.0.CR1/Component_Reference/en-US/html_single/#sect-Component_Reference-Tables_and_grids-Basic_sorting
* "Built-in filtering documentation for the @<rich:externdedDataTable>@":http://docs.jboss.org/richfaces/4.3.X/4.3.0.CR1/Component_Reference/en-US/html_single/#sect-Component_Reference-Table_filtering-builtin_filtering

Also, check out the code samples in the showcase:

* "Code sample for @<rich:focus>@":http://showcase-latest.richfaces.org/richfaces/component-sample.jsf?demo=focus
* "Code sample for @<rich:placeholder>@":http://showcase-latest.richfaces.org/richfaces/component-sample.jsf?demo=placeholder
* "Code sample for built-in sorting and filtering with the @<rich:externdedDataTable>@":http://showcase-latest.richfaces.org/richfaces/component-sample.jsf?demo=extendedDataTable&sample=edt-builtin-sorting-and-filtering

h2. Bug fixes

Most of the bug fixes in CR1 centered around the new 4.3 features.  These bug fixes include:

h3. Validation fixes
* ["RF-12700":https://issues.jboss.org/browse/RF-12700] - LongRangeValidator client-side messages differs from server-side ones on MyFaces
* ["RF-12669":https://issues.jboss.org/browse/RF-12669] - Autocomplete: client side validation for custom validators doesn't work

h3. Select component fixes
* ["RF-12608":https://issues.jboss.org/browse/RF-12608] - pickList without collectionType results in failure to lazily load
* ["RF-12692":https://issues.jboss.org/browse/RF-12692] - rich:select - unknown validator SelectLabelValueValidator

h3. New component fixes
* ["RF-12650":https://issues.jboss.org/browse/RF-12650] - rich:placeholder: when @rendered=false the placeholder is still rendered
* ["RF-12668":https://issues.jboss.org/browse/RF-12668] - rich:focus - stops to work when containing form is re-rendered by another form

* Iteration component fixes
* ["RF-12662":https://issues.jboss.org/browse/RF-12662] - Showcase - rich:extendedDataTable - Built-in sorting and filtering - ELException when text filter value provided instead of expected numbers
* ["RF-12691":https://issues.jboss.org/browse/RF-12691] - extendedDataTable: Header facet render problem in RichFaces 4
* ["RF-12672":https://issues.jboss.org/browse/RF-12672] - Collapsible sub table: noData facet doesn't work inside switchable panels
* ["RF-12673":https://issues.jboss.org/browse/RF-12673] - Collapsible sub table: filtering doesn't work inside switchable panels
* ["RF-12684":https://issues.jboss.org/browse/RF-12684] - The last page shows rows from the page before if rich:collapsibleSubTable is included in rich:dataTable with rich:dataScroller.
* ["RF-12714":https://issues.jboss.org/browse/RF-12714] - Showcase and rich:dataTable: sorting in Arrangeable demo doesn't work

h3. JSF compatibility fixes
* ["RF-12670":https://issues.jboss.org/browse/RF-12670] - JSF 2.0 compatibility issue, NoSuchFieldError: javax/faces/component/visit/VisitHint.SKIP_ITERATION
* ["RF-12693":https://issues.jboss.org/browse/RF-12693] - Mojarra fails to encode form inputs correctly when they doesn't have name attribute

h3. Drag and drop fixes
* ["RF-12666":https://issues.jboss.org/browse/RF-12666] - Showcase - Drag and Drop with indicator - the styles do not apply for indicator when dragging over various targets
* ["RF-12671":https://issues.jboss.org/browse/RF-12671] - dropTarget does not work inside dynamic tabs when switchType is ajax or server
* ["RF-12703":https://issues.jboss.org/browse/RF-12703] - showcase - drag and drop - JS error with default dragIndicator

h3. Input fixes
* ["RF-11067":https://issues.jboss.org/browse/RF-11067] - rich:autocomplete popups with suggestions does not reflect the value in input
* ["RF-11565":https://issues.jboss.org/browse/RF-11565] - Showcase: multiple selections in rich:autocomplete doesn't work when 'clicking' is used
* ["RF-12707":https://issues.jboss.org/browse/RF-12707] - rich:calendar - setValue(...) method from javascript API doesn't work correctly

h3. Misc fixes
* ["RF-12708":https://issues.jboss.org/browse/RF-12708] - rich:jQuery: wrong VDL documentation of selector attribute
* ["RF-12716":https://issues.jboss.org/browse/RF-12716] - VDL-doc for a4j:ajax incorrectly states that the listener method cannot accept parameters
* ["RF-12709":https://issues.jboss.org/browse/RF-12709] - richfaces.js: fire ajaxcomplete event
* ["RF-12705":https://issues.jboss.org/browse/RF-12705] - vdl documentation for a4j:outputPanel contains non-implemented layout=&quot;none&quot;
* ["RF-12713":https://issues.jboss.org/browse/RF-12713] - Listeners don't work inside panels

h2. Moving forward

We'll let RichFaces 4.3.0.CR1 bake in the community for a few weeks.  Take it for a spin, and "report any regressions":https://issues.jboss.org/browse/RF you should come across that our "top-notch QE team":http://blog.pavol.pitonak.com/2012/09/meet-richfaces-qe-team.html might have overlooked.  Hopefully we can have a final release out by the end of the month.
