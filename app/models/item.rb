class Item < ActiveRecord::Base

    # Relationships

    belongs_to :site

    # Validation

    validates :name, presence: {:message => "An item must have a name"}
    validates :site_id, presence: {:message => "An item should not exist without an associated site"}
    validates :site, presence: {:message => "The site this item references does now exist"}

    before_save do
        self.set_alphabet_letter
    end

    public

    protected

    def set_alphabet_letter
        self.alphabet_letter = self.name[0].upcase if !self.name.blank?
    end


end
