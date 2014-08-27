class Virtualcollection < ActiveRecord::Base

    # Relationships
    belongs_to :site
    has_and_belongs_to_many :items

    # Validations
    validates :name, presence: {:message => I18n.t('virtualcollection.validations.name')}
    validates :name, uniqueness: {:message => I18n.t('virtualcollection.validates.name_unique'), :scope => :site_id}
    validates :site, presence: {:message => I18n.t('virtualcollection.validations.site')}

end
