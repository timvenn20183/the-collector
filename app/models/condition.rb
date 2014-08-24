class Condition < ActiveRecord::Base

    # Relationships
    belongs_to :site

    # Validations
    validates :name, presence: {:message => "A condition must have a name"}
    validates :site, presence: {:massage => "A condition must belong to a site"}

end
