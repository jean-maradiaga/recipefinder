class CookBook < ActiveRecord::Base
  belongs_to :user
  has_many :recipes, dependent: :destroy
end
