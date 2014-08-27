class Site < ActiveRecord::Base

    # Relationships
    has_many :items
    has_many :rolodexes
    has_many :conditions
    has_many :virtualcollections
    has_many :categories
    has_many :itemfields
    has_many :fieldoptions, :through => :itemfields
    has_many :dialogs

    # Validations
    validates :title, presence: {:message => I18n.t('site.validations.title')}
    validates :email,  presence: {:message => I18n.t('site.validations.email')}
    validates :email, uniqueness: {:message => I18n.t('site.validations.email_unique')}
    validates :password, presence: {:message => I18n.t('site.validations.password')}
    validates :code, presence: {:message => I18n.t('site.validations.code')}
    validates :code, uniqueness: {:message => I18n.t('site.validations.code_unique')}

end
