class Site < ActiveRecord::Base

    # Relationships
    has_many :items

    # Validations

    validates :title, presence: {:message => "Please supply a title for this site"}
    validates :email,  presence: {:message => "Please supply and email address"}
    validates :password, presence: {:message => "Please supply a password. Passwords may not be blank"}
    validates :code, presence: {:message => "Please supply a site code" }

end
