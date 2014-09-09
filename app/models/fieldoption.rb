class Fieldoption < ActiveRecord::Base

    extend FriendlyId
    friendly_id :name, use: :slugged

	# Relationships
	has_and_belongs_to_many :items
	has_and_belongs_to_many :images
	belongs_to :itemfield

	# Validations
	validates :name ,presence: {:message => I18n.t('fieldoption.validations.name')}
	validates :name ,uniqueness: {:message => I18n.t('fieldoption.validations.name_unique'), :scope => :itemfield_id}
	validates :itemfield, presence: {:message => I18n.t('fieldoption.validations.itemfield')}

	public

	def self.destroy_unassociated
		Fieldoption.all.each do |fieldoption|
    		fieldoption.destroy if fieldoption.items.count == 0
    	end
    	Itemfield.all.each do |itemfield|
            itemfield.destroy if itemfield.fieldoptions.count == 0
        end
	end

	def self.create_from_string(itemfield,fieldoptions_string)
		fieldoptions = Array.new
		fieldoptions_string.split(",").each do |fieldoption|
            fieldoptions << Fieldoption.find_or_create_by(name: fieldoption, itemfield: itemfield)
        end
        return fieldoptions
	end

	protected

end