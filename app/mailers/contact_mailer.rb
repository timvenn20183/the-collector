class ContactMailer < ActionMailer::Base

    default from: "info@oldcomputers.co.za"

    def send_comment(comment)
    	@name = comment.name
    	@email = comment.email
    	@message = comment.message
    	@subject = comment.subject
    	mail(subject: "Contact from oldcomputers.co.za website",
    		 to: 'floyd20183@gmail.com').deliver!
    end

end
