class User < ActiveRecord::Base
	has_many :menus, dependent: :destroy
	has_many :cook_books, dependent: :destroy

	has_secure_password
end
