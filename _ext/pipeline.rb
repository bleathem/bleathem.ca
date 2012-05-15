require File.join File.dirname(__FILE__), 'tweakruby'
require_relative 'posts2'
require_relative 'posts_map'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts2.new( '/posts', :posts )
  extension PostsMap.new
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page=>7 )
  # extension Awestruct::Extensions::Indexifier.new
end
