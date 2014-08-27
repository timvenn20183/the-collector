class Itemfield < ActiveRecord::Base

	# Relationships
	belongs_to :site
	has_many :fieldoptions
	has_many :items, :through => :fieldoptions

	# Validations
	validates :name, presence: {:message => I18n.t('itemfield.validations.name')}
	validates :name, uniqueness: {:message => I18n.t('itemfield.validations.name_unique'), :scope => :site_id}
	validates :site, presence: {:message => I18n.t('itemfield.validations.site')}

end
