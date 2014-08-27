class Category < ActiveRecord::Base

    # Relationships
    belongs_to :site
    has_and_belongs_to_many :items

    # Validations
    validates :name, presence: {:message => I18n.t('category.validations.name')}
    validates :name, uniqueness: {:message => I18n.t('category.validations.name_unique'), :scope => :site_id}
    validates :site, presence: {:message => I18n.t('category.validations.site')}

end
