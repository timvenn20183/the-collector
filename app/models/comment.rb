class Comment < ActiveRecord::Base
  has_and_belongs_to_many :items

	# Relationships
  	has_and_belongs_to_many :blogs

	# Validations
	validates :name, presence: {:message => I18n.t('comment.validations.name')}
	validates :email, presence: {:message => I18n.t('comment.validations.email')}
	validates :subject, presence: {:message => I18n.t('comment.validations.subject')}
	validates :message, presence: {:message => I18n.t('comment.validations.message')}

	scope :approved, lambda {self.all.order(created_at: :desc)}

	after_create do
		email_comment
	end

	def email_comment
		ContactMailer.send_comment(self)
	end

end
