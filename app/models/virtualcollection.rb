class Virtualcollection < ActiveRecord::Base

    extend FriendlyId
    friendly_id :name, use: :slugged

    # Relationships
    has_and_belongs_to_many :items
    has_and_belongs_to_many :images

    # Validations
    validates :name, presence: {:message => I18n.t('virtualcollection.validations.name')}
    validates :name, uniqueness: {:message => I18n.t('virtualcollection.validates.name_unique')}

    public

    def self.destroy_unassociated
    	Virtualcollection.all.each do |virtualcollection|
    		virtualcollection.destroy if virtualcollection.items.count == 0
    	end
    end

    def self.create_from_string(virtualcollections_string)
        virtualcollections = Array.new
        virtualcollections_string.split(",").each do |virtualcollection|
            virtualcollections << Virtualcollection.find_or_create_by(name: virtualcollection.strip)
        end
        return virtualcollections
    end

    protected

end
