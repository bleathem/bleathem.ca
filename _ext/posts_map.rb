class PostsMap
  def execute(site)
    years = {}
    site.posts.each do |post|
      year = post.date.year
      if (! years.key?(year) )
        years[year] = {}
      end
      months = years[year]
      month = post.date.month
      if (! months.key?(month) )
        months[month] = []
      end
      posts = months[month]
      posts << post
    end
    site.post_map = years
  end
end
