class Item < ActiveRecord::Base

    extend FriendlyId

    # Relationships

    has_and_belongs_to_many :virtualcollections
    has_and_belongs_to_many :conditions
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :rolodexes
    has_and_belongs_to_many :fieldoptions
    has_and_belongs_to_many :images
    has_many :itemfields, :through => :fieldoptions

    # Validations

    validates :name, presence: {:message => I18n.t('item.validations.name')}

    friendly_id :name, use: :slugged

    scope :featured, lambda {self.last}
    scope :latest, lambda {self.last(4)[0..2]}

    before_save do
        self.set_alphabet_letter
        self.set_search_string
    end

    public

    # Create and allocate virtualcollections from a comma separated string
    def set_virtualcollections_by_string(virtualcollections_string)
        self.virtualcollections = Virtualcollection.create_from_string(virtualcollections_string)
    end

    def get_virtualcollections_string
        self.virtualcollections.pluck(:name).join(" / ")
    end

    # Create and allocate conditions from a comma separated string
    def set_conditions_by_string(conditions_string)
        self.conditions = Condition.create_from_string(conditions_string)
    end

    def get_conditions_string
        self.conditions.pluck(:name).join(" / ")
    end

    # Create and allocate categories from a comma separated string
    def set_categories_by_string(categories_string)
        self.categories = Category.create_from_string(categories_string)
    end

    def get_categories_string
        self.categories.pluck(:name).join(" / ")
    end

    # Create and allocate rolodexes from a comma separated string
    def set_rolodexes_by_string(rolodexes_string)
        self.rolodexes = Rolodex.create_from_string(rolodexes_string)
    end

    def get_rolodexes_string
        self.rolodexes.pluck(:name).join(" / ")
    end

    # Create and associate itemfields and fieldoptions based on comma separated string
    def set_itemfield_with_fieldoptions(itemfield_string,fieldoptions_string)
        itemfield = Itemfield.create_from_string(itemfield_string).first
        self.fieldoptions << Fieldoption.create_from_string(itemfield,fieldoptions_string)
        self.save
    end

    def get_all_fieldoptions_string
        self.fieldoptions.pluck(:name).join(" / ")
    end

    protected

    # set alphabetical letter based on name of item
    def set_alphabet_letter
        self.alphabet_letter = self.name[0].upcase if !self.name.blank?
    end

    # set the search string
    def set_search_string
        self.search_string = self.name
        self.search_string += self.year.to_s
        self.search_string += self.get_rolodexes_string.gsub(" / ","")
        self.search_string += self.get_categories_string.gsub(" / ","")
        self.search_string += self.get_conditions_string.gsub(" / ","")
        self.search_string += self.get_virtualcollections_string.gsub(" / ","")
        self.search_string += self.get_all_fieldoptions_string.gsub(" / ","")
        self.search_string = self.search_string.gsub(" ","").downcase
    end

end
