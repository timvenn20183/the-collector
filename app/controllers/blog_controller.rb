class BlogController < ApplicationController

	def index
		@blog = Blog.latest_blog
	end

	def view
		@blog = Blog.where(:slug => params[:id]).first
	end

end
