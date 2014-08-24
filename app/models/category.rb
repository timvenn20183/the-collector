class Category < ActiveRecord::Base

    # Relationships
    belongs_to :site

    # Validations
    validates :name, presence: {:message => "A category must have a name"}
    validates :site, presence: {:message => "A category must be associated to a valid site"}

end
