class Rolodex < ActiveRecord::Base

    # Relationships
    belongs_to :site

    # Validations
    validates :name, presence: {:message => "Rolodex entry must have a name"}
    validates :site, presence: {:message => "Rolodex must be associated with a site"}

end
