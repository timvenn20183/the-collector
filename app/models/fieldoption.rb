class Fieldoption < ActiveRecord::Base
  

	# Relationships
	belongs_to :itemfield
	has_and_belongs_to_many :items		

	delegate :site, to: :itemfield

	# Validations
	validates :name ,presence: {:message => I18n.t('fieldoption.validations.name')}
	validates :name ,uniqueness: {:message => I18n.t('fieldoption.validations.name_unique'), :scope => :itemfield_id}
	validates :itemfield, presence: {:message => I18n.t('fieldoption.validations.itemfield')}
	
end