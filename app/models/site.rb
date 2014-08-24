class Site < ActiveRecord::Base

    # Relationships
    has_many :items
    has_many :rolodexes
    has_many :conditions
    has_many :virtualcollections
    has_many :categories

    # Validations
    validates :title, presence: {:message => "Please supply a title for this site"}
    validates :email,  presence: {:message => "Please supply and email address"}
    validates :email, uniqueness: {:message => "The email address supplied is already in use. Please provide an alternate email address"}
    validates :password, presence: {:message => "Please supply a password. Passwords may not be blank"}
    validates :code, presence: {:message => "Please supply a site code" }
    validates :code, uniqueness: {:message => "The site code you have selected is already in use. Please choose and alternate code"}

end
