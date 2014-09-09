class Rolodex < ActiveRecord::Base

    extend FriendlyId
    friendly_id :name, use: :slugged

    # Relationships
    has_and_belongs_to_many :items
    has_and_belongs_to_many :images

    # Validations
    validates :name, presence: {:message => I18n.t('rolodex.validations.name')}
    validates :name, uniqueness: {:message => I18n.t('rolodex.validations.name_unique')}

    public

    def self.destroy_unassociated
    	Rolodex.all.each do |rolodex|
    		rolodex.destroy if rolodex.items.count == 0
    	end
    end

    def self.create_from_string(rolodexes_string)
        rolodexes = Array.new
        rolodexes_string.split(",").each do |rolodex|
            rolodexes << Rolodex.find_or_create_by(name: rolodex.strip)
        end
        return rolodexes
    end

    protected

end
