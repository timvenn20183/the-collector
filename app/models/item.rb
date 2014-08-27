class Item < ActiveRecord::Base
  

    # Relationships

    belongs_to :site
    has_and_belongs_to_many :virtualcollections
    has_and_belongs_to_many :conditions
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :rolodexes
    has_and_belongs_to_many :fieldoptions
    has_many :itemfields, :through => :fieldoptions     

    # Validations

    validates :name, presence: {:message => I18n.t('item.validations.name')}
    validates :site_id, presence: {:message => I18n.t('item.validations.site_id')}
    validates :site, presence: {:message => I18n.t('item.validations.site')}

    before_save do
        self.set_alphabet_letter
    end

    public

    protected

    def set_alphabet_letter
        self.alphabet_letter = self.name[0].upcase if !self.name.blank?
    end


end
