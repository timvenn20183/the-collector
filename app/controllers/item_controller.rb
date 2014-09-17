class ItemController < ApplicationController

	layout 'collection', :only => [:view]

	def index
	end

	def view
		@item = Item.where(slug: params[:id]).first
		not_found if @item.blank?
	end

end
