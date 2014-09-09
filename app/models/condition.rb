class Condition < ActiveRecord::Base

    extend FriendlyId
    friendly_id :name, use: :slugged

    # Relationships
    has_and_belongs_to_many :items
    has_and_belongs_to_many :images

    # Validations
    validates :name, presence: {:message => I18n.t('category.validations.name')}
    validates :name, uniqueness: {:message => I18n.t('category.validations.name_unique')}

    def self.destroy_unassociated
    	Condition.all.each do |condition|
    		condition.destroy if condition.items.count == 0
    	end
    end

    def self.create_from_string(conditions_string)
        conditions = Array.new
        conditions_string.split(",").each do |condition|
            conditions << Condition.find_or_create_by(name: condition.strip)
        end
        return conditions
    end

    protected

end
