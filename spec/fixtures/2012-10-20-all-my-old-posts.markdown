---
layout: post
title: "All my old posts"
date: 2012-10-20 08:45
comments: true
categories: 
---
I finally brought in my old blog posts. I wrote a small [ruby
script](https://github.com/rlb3/update-blog/blob/master/wp2op.rb) to
do the job. The last blog engine I used was wordpress. That was a huge
mistake. When I migrated into wordpress it ignored the date I sent and
set all the entries to post time to that day. And I use a wordpress
backup xml file to bring over all posts into this blog so now this blog has the
wrong day for those posts. I'm not sure how I'm going to fix it at
this point. I need to find a back up of the database I used to import
into wordpress.

Oh well, at least I have the content.

One good thing I that came out of it was I got to use the ruby gem
Nokogiri. On the perl side I like XML::Twig but Nokogiri was so much
better. The xpath method is very handy. I've used xml parser in perl,
objective-c, common lisp, emacs-lisp and clojure but Nokogiri was the
easiest to use. And from the docs, it has great support for scraping
html my css selectors. I will definitely use Nokogiri in the future.