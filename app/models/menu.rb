class Menu < ActiveRecord::Base
  belongs_to :user
  has_many :courses_menus, dependent: :destroy
end
