class BlogController < ApplicationController

	def index
		@blog = Blog.latest_blog
	end

	def view
		@blog = Blog.where(:slug => params[:id]).first
		not_found if @blog.blank?
	end

end
