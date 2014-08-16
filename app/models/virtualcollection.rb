class Virtualcollection < ActiveRecord::Base

    # Relationships
    belongs_to :site

    # Validations
    validates :name, presence: {:message => "A virtualcollection must have a name"}
    validates :site, presence: {:message => "A virtualcollection must belong to a valid site"}
    validates :site_id, presence: {:message => "A virtualcollection must belong to a site"}

end
