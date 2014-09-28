class MainController < ApplicationController

    layout 'collection', :only => [:search]

    def index
        @featured_item = Item.featured
    end

    def search
        @search = params[:search]
        if !@search.blank? then
            @db_search = ("%" + @search + "%").downcase.gsub(" ","")
            @items = Item.where("search_string like ?",@db_search).paginate(:page => params[:page], :per_page => 25)
        else
            @search = "Recent items"
            @items = Item.where("id > ?",Item.last.id-25).paginate(:page => params[:page], :per_page => 25)
        end
        if @items.blank?
            @notice_header = "No results found"
            @notice_body = "Please note that no results were found matching your criteria."
            render 'main/notice'
        end
    end

    def contact
        saved_comment = Comment.find(decrypt(params[:id])) if decrypt(params[:id]) != nil
        render 'contact_success' if !saved_comment.blank?
        @comment = Comment.new
        @comment.subject = "General site enquiry" if @comment.subject == nil
    end

    def process_contact
        @comment = Comment.create(comment_params)
        @comment.blogs << Blog.find_by_slug(params[:blog]) if !params[:blog].blank?
        @comment.items << Item.find_by_slug(params[:item]) if !params[:item].blank?
        @comment.id != nil ? (redirect_to '/contact/' + encrypt(@comment.id.to_s)) : (redirect_to contact_url if @comment.id == nil)
    end

    def links
    end

    private

    def comment_params
        params.permit(:name, :email, :message, :subject)
    end

end
