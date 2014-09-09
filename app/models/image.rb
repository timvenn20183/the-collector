class Image < ActiveRecord::Base

	# Relationships
	has_and_belongs_to_many :blogs
 	has_and_belongs_to_many :virtualcollections
    has_and_belongs_to_many :rolodexes
    has_and_belongs_to_many :itemfields
    has_and_belongs_to_many :items
    has_and_belongs_to_many :fieldoptions
    has_and_belongs_to_many :conditions
    has_and_belongs_to_many :categories

	# Validations
	validates :name, presence: {:message => I18n.t('image.validations.name')}

	# Other
	mount_uploader :rawimage, RawimageUploader

end
