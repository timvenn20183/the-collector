class Dialog < ActiveRecord::Base

	# Relationships
	belongs_to :site

	# Validations
	validates :code, presence: {:message => I18n.t('dialog.validations.code')}
	validates :code, uniqueness: {:message => I18n.t('dialog.validations.code_unique'), :scope => :site_id}
	validates :site, presence: {:message => I18n.t('dialog.validations.site')}

	before_save :set_default_content

	protected

	def set_default_content
		self.content = I18n.t('dialog.defaults.content') if self.content == nil
	end

end
