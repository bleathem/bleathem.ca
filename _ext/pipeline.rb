require File.join File.dirname(__FILE__), 'tweakruby'
require_relative 'posts2'
require_relative 'posts_map'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts2.new( '/blog', :posts )
  extension PostsMap.new
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page=>7 )
  extension Awestruct::Extensions::Tagger.new( :posts, '/index', '/blog/tags', :per_page=>10 )
  extension Awestruct::Extensions::TagCloud.new( :posts, 'blog/tags/index.xhtml')
  extension Awestruct::Extensions::Atomizer.new( :posts, '/feed.atom', :feed_title=>'Java EE - Experiences of a Developer | by Brian Leathem' )
end
