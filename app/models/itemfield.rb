class Itemfield < ActiveRecord::Base

    extend FriendlyId
    friendly_id :name, use: :slugged

	# Relationships
	has_many :fieldoptions
	has_many :items, :through => :fieldoptions
	has_and_belongs_to_many :images

	# Validations
	validates :name, presence: {:message => I18n.t('itemfield.validations.name')}
	validates :name, uniqueness: {:message => I18n.t('itemfield.validations.name_unique')}

	scope :itemfields_menu_list, lambda {self.where(name: 'Platforms')}

	public

	def self.create_from_string(itemfields_string)
		itemfields = Array.new
			itemfields_string.split(",").each do |itemfield|
				itemfields << Itemfield.find_or_create_by(name: itemfield)
			end
		return itemfields
	end

end
