class MainController < ApplicationController

    layout 'collection', :only => [:search]

    def index
        @featured_item = Item.featured
    end

    def search
    	@search = params[:search]
        @db_search = ("%" + @search + "%").downcase.gsub(" ","")
        @items = Item.where("search_string like ?",@db_search).paginate(:page => params[:page], :per_page => 25)
    end

    def contact
        saved_comment = Comment.find(decrypt(params[:id])) if decrypt(params[:id]) != nil
        render 'contact_success' if !saved_comment.blank?
        @comment = Comment.new
        @comment.subject = "General site enquiry" if @comment.subject == nil
    end

    def process_contact
    	name = params[:name]
    	email = params[:email]
    	message = params[:message]
        subject = params[:subject]
        @comment = Comment.create(name: name, email: email, message: message, subject: subject)
        redirect_to '/contact/' + encrypt(@comment.id.to_s) if @comment.id != nil
        redirect_to '/contact' if @comment.id == nil
    end
end
