class MainController < ApplicationController

    def index
    end

    def search
    	@search = params[:search]
    end

    def contact
        @comment = Comment.new
        @comment.subject = "General site enquiry" if @comment.subject == nil
    end

    def process_contact
        # STUB
    	name = params[:name]
    	email = params[:email]
    	message = params[:message]
        subject = params[:subject]
        @comment = Comment.create(name: name, email: email, message: message, subject: subject)
        redirect_to '/'
    end

end
