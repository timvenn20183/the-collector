require 'rubygems'
require '../config/environment'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://oldcomputers.co.za'
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/collection', :changefreq => 'daily', :priority => 0.9
  add '/blogs', :changefreq => 'daily', :priority => 0.9
  add '/links', :changefreq => 'daily', :priority => 0.9

  Blog.find_each do |blog|
    add blog_path(blog), lastmod: blog.updated_at
  end
  Item.find_each do |item|
    add item_path(item), lastmod: item.updated_at
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
#SitemapGenerator::Sitemap.ping_search_engines
