#!/usr/bin/ruby1.9.1
require 'nokogiri'
require 'clothred'
require 'net/http'

class BlogFileParser

  def initialize path
    raise ArgumentError unless File.exists?( path )

    @file = File.open(path)
    @blog = Nokogiri::XML(@file)
  end

  def parse_entries()
    puts "parsing..."
    Dir.mkdir("_site") unless File.exists?("_site")
    Dir.mkdir("_site/images") unless File.exists?("_site/images")
    Dir.mkdir("_site/posts") unless File.exists?("_site/posts")
    Dir.mkdir("_site/images/blog") unless File.exists?("_site/images/blog")
    
    entries = @blog.xpath("//atom:entry", "atom" => "http://www.w3.org/2005/Atom")
    entries.each do |entry|
      id = entry.xpath("atom:id", "atom" => "http://www.w3.org/2005/Atom").text
      categories = entry.xpath("atom:category", "atom" => "http://www.w3.org/2005/Atom")
      is_post = false
      tags = []
      categories.each do |category|
        if (category['term'] == 'http://schemas.google.com/blogger/2008/kind#post')
          is_post = true
        else
          tags << category['term']
        end
      end
      next if (! is_post) 
      #puts "Entry ID: #{id} is a post, converting..."
      content = entry.xpath("atom:content", "atom" => "http://www.w3.org/2005/Atom")
      text = content.text
      #puts content.text
      clothred = ClothRed.new(text)
      textile = clothred.to_textile
      #puts markdown
      write_entry(entry, content, textile, tags)
    end
  end

  def write_entry(entry, content, textile, tags)
    #puts
    #puts entry
    date_str = entry.xpath("atom:published", "atom" => "http://www.w3.org/2005/Atom").text + " +0000"
    link_rel = entry.xpath("atom:link[@rel='alternate']", "atom" => "http://www.w3.org/2005/Atom");
    name = nil;
    href = link_rel[0]['href']
    chunks = href.split("/")
    name = chunks[chunks.size - 1]
    chunks = name.split(".")
    name = chunks[0]

    date = Time.parse(date_str).utc
    blog_id = date.strftime("%Y-%m-%d-"+name)
    filename = blog_id + '.textile'
    puts filename;
    path = '_site/posts/'+filename
    
    title = entry.xpath("atom:title", "atom" => "http://www.w3.org/2005/Atom").text
    head = "---\nlayout: post\ntitle: \"#{title}\"\n"
    if (tags.any?)
      head = head + "tags: [ #{tags.join(', ')} ]\n"
    end
    head = head + "---\n\n"
    textile = head + textile
    textile.gsub!( %r{#\{}, '\#{' )

    download_images(content, textile, blog_id)

    File.open(path, 'w') do |f|
      f.puts textile
    end

  end

  def download_images(content, textile, blog_id)
    html = Nokogiri::HTML(content.text)
    imgs = html.xpath("//img")
    count = 1
    imgs.each do |img|
      url = URI.parse(img['src'])
      puts "Downloading #{url}"
      use_ssl = url.scheme == 'https'
      Net::HTTP.start(url.host, url.port, nil, nil, nil, nil, {use_ssl: use_ssl}) do |http|        
        chunks = url.path.split('/')
        filename = chunks[chunks.size - 1]
        if filename.size > 50
          filename = blog_id + "_" + count.to_s + ".png"
          count = count + 1
        end
        folder = "_site/images/blog/" + blog_id
        Dir.mkdir(folder) unless File.exists?(folder)
        path = folder + "/" + filename
        resp = http.get(url.path)
        open(path, "wb") do |file|
          file.write(resp.body)
        end
        puts img['src']
        img_link = img['src'].sub(/s\d+/, "s1600")
        new_img_src = '/images/blog/'+blog_id+'/'+filename
        textile.gsub!( img['src'], new_img_src)
        textile.gsub!( img_link, new_img_src)

      end
    end
  end
end

blogger = BlogFileParser.new(ARGV[0])
blogger.parse_entries
