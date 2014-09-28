class BlogController < ApplicationController

	before_action :authenticate, except: [:index , :view]

	def index
		@blog = Blog.latest
		@allow_blog_comments = true
	end

	def view
		@blog = Blog.where(:slug => params[:id]).first
		@allow_blog_comments = true
		not_found if @blog.blank?
	end

	def edit
		@blog = Blog.find_by_slug(params[:id])
	end

	def new
		@blog = Blog.new
	end

	def process_blog
		@blog = Blog.create_with(blog_params).find_or_create_by(id: decrypt(params[:id]))
		@blog.slug = nil
		@blog.update_attributes(blog_params)
		@blog.save
		redirect_to '/blogs'
	end

	private

	def blog_params
		params.permit(:title, :content)
	end

end
