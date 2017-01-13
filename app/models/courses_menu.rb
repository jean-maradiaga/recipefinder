class CoursesMenu < ActiveRecord::Base
  belongs_to :menu
  has_and_belongs_to_many :recipes, dependent: :destroy
end
