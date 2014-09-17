class VirtualcollectionController < ApplicationController

	layout 'collection'

	def view
		@virtualcollection = Virtualcollection.find_by_slug(params[:id])
		@items = @virtualcollection.items.paginate(:page => params[:page], :per_page => 25)
		not_found if @virtualcollection == nil
	end

end
