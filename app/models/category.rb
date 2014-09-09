class Category < ActiveRecord::Base

    extend FriendlyId
    friendly_id :name, use: :slugged

    # Relationships
    has_and_belongs_to_many :items
    has_and_belongs_to_many :images

    # Validations
    validates :name, presence: {:message => I18n.t('category.validations.name')}
    validates :name, uniqueness: {:message => I18n.t('category.validations.name_unique')}

    public

    def self.destroy_unassociated
    	Category.all.each do |category|
    		category.destroy if category.items.count == 0
    	end
    end

    def self.create_from_string(categories_string)
        categories = Array.new
        categories_string.split(",").each do |category|
            categories << Category.find_or_create_by(name: category.strip)
        end
        return categories
    end

    protected


end
