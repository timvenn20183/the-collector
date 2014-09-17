class FieldoptionController < ApplicationController

	layout 'collection'

	def view
		@itemfield = Itemfield.find_by_slug(params[:itemfield])
		@fieldoption = Fieldoption.where(slug: params[:id], itemfield: @itemfield).first
		@items = @fieldoption.items.paginate(:page => params[:page], :per_page => 25)
		not_found if @itemfield.blank?
		not_found if @fieldoption.blank?
	end

end
