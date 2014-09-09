class Blog < ActiveRecord::Base

	extend FriendlyId
    friendly_id :title, use: :slugged

	# Relationships
	has_and_belongs_to_many :images

	# Validations
	validates :title, presence: {:message => I18n.t('blog.validations.title')}

	scope :latest_blog, lambda {self.last}
    scope :recent_list, lambda {self.order(created_at: :desc).last(4)[0..2]}

	protected

end
