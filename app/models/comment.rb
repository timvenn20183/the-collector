class Comment < ActiveRecord::Base

	# Relationships

	# Validations
	validates :name, presence: {:message => I18n.t('comment.validations.name')}
	validates :email, presence: {:message => I18n.t('comment.validations.email')}
	validates :subject, presence: {:message => I18n.t('comment.validations.subject')}
	validates :message, presence: {:message => I18n.t('comment.validations.message')}

end
