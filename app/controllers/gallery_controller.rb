class GalleryController < ApplicationController

	def index
		@images = Image.all.paginate(:page => params[:page], :per_page => 12)
	end

end
