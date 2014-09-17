class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def encrypt(value)
        secret = Digest::SHA1.hexdigest('ocd')
        code = ActiveSupport::MessageEncryptor.new(secret)
        return code.encrypt_and_sign(value.to_s)
    end

    def decrypt(value)
    	begin
            secret = Digest::SHA1.hexdigest('ocd')
            code = ActiveSupport::MessageEncryptor.new(secret)
            return code.decrypt_and_verify(value.to_s)
        rescue
        	return nil
       	end
    end

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end

end
