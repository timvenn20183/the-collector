class ContactMailer < ActionMailer::Base

    default from: "info@oldcomputers.co.za"

    def send_contact(name,email,message,subject)
    	@name = name
    	@email = email
    	@message = message
    	@subject = subject
    	mail(subject: "Contact from oldcomputers.co.za website",
    		 to: 'floyd20183@gmail.com').deliver!
    end

end
