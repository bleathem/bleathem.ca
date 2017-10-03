---
  title: "I'm Awestruct"
  date: 2012-05-15
  author: Brian Leathem
  categories: [Tools]
  tags: [ Awestruct, Ruby, HAML, Blog, git, Blogger ]
  description:
  linktitle:
  featured:
  featuredpath:
  featuredalt:
  type: post
  disqus_identifier: 2012-05-15-im-awestruct
  disqus_title: im-awestruct
  disqus_url: http://blog.bleathem.ca/2012/05/im-awestruct.html
  aliases:
    - /blog/2012/05/im-awestruct.html
---

I'm officially "Awestruct":http://www.awestruct.org! with this launch of my new blog.  My old "blogger.com blog":http://blog.bleathem.ca will soon redirect here, as I have ported over all the content.  Thanks blogger.com for keeping the data Open by providing a data export API!  It has me leaving your great service with a nothing but positive experience.

If you haven't heard, Awestruct is a great Ruby-based tool for building static HTML websites.  A project originally started by "Bob McWhirter":http://bob.mcwhirter.org/, it has grown in true Open Source fashion with a number of new users and "contributors":http://github.com/awestruct.  While awestruct is centred around creating websites with static HTML content, HTML these days is very far from static.  With so many content providers providing web APIs, it's easy to consume content with javascript and give a static page a dynamic feel.  Some examples of truly fantastic dynamic capabilities include:

* the comment system of this new blog (driven by "Disqus":http://www.disqus.com)
* the "twitter":http://www.twitter.com/brianleathem feed in the side panel

These are both great examples of content both consumed and created by a javascript interface on a "static" HTML website.

Other content areas that seem to be dynamic (eg. requiring a database back end) are in fact static.  Things like a tag cloud and blog archive are really only dynamic at the time you publish your material.  There is no need to query a database with every page render - simply build up an index whenever a page is published.  And this is just a simple blog!

I encourage you to take the time to explore the "Arquillian":http://www.arquillian.org website, which is truly a great example of what can be done with static HTML and harvesting dynamic data at publish time, and engaging the project community to contribute content to the site.  I look forward to seeing what similar goals we can accomplish with the "RichFaces":http://www.richfaces.org website as we port it to being built with Awestruct.

Switching over to awestruct has given me a great chance to explore some new technologies:

* I wrote some [Ruby](http://ruby-lang.org) to "parse the blogger XML dump":https://github.com/bleathem/bleathem.ca/blob/master/_tools/convert/convert.rb (Warning: it's my first stab at Ruby, and it's ugly code!).
* I built the page templates with [HAML](http://haml-lang.com)
* The site is styled with [Bootstrap](http://twitter.github.com/bootstrap/).
* Blog posts themselves are authored in [Textile](http://en.wikipedia.org/wiki/Textile_(markup_language)).

There's nothing like trying something new to expose pre-conceptions you didn't even know you had.  I look forward to seeing how I can take the lessons I've learnt, and fold them in to make the JSF web development experience better.

Lastly, a word on the tools used to manage this blog.  With this new setup:

* I author my content in my favourite plain text editor (Emacs!)
* push content to [github](http://github.com/bleathem/bleathem.ca).
* publish with a simple rsync.

Finally I get to leverage the tools I use everyday and am intimately familiar with to create content and share my ideas.  Hopefully this gets me bogging more frequently - that's the plan at least!
