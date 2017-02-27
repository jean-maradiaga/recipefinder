class User < ActiveRecord::Base
	before_create :create_activation_digest
	before_save   :downcase_email, :trim_whitespace => [:email, :password, :password_confirmation]

	has_many :menus, dependent: :destroy
	has_many :cook_books, dependent: :destroy

	# Uses gem bcrypt to create a secure hashed password
	has_secure_password

	validates_confirmation_of :password # This automatically validates if :password == :password_confirmation

    # Custom regex to validate email.
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
               format: { with: VALID_EMAIL_REGEX }

    # Validates the given attr is unique across the database.
	validates_uniqueness_of :email

	attr_accessor :activation_token, :reset_token

	# Removes whitespaces
	# auto_strip_attributes :email, :password, :squish => true


	  # Returns the hash digest of the given string.
	  def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end

	  # Returns a random token.
	  def User.new_token
	    SecureRandom.urlsafe_base64
	  end

	  # Returns true if the given token matches the digest.
	  def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	  end

	  # Activates an account.
	  def activate
	    update_columns(status: true, activated_at: Time.zone.now)
	  end

	  # Sends activation email.
	  def send_activation_email
	    UserMailer.account_activation(self).deliver_now
	  end

	# Sets the password reset attributes.
	  def create_reset_digest
	    self.reset_token = User.new_token
	    update_columns(reset_digest:User.digest(reset_token), reset_sent_at: Time.zone.now)
	  end

	  # Sends password reset email.
	  def send_password_reset_email
	    UserMailer.password_reset(self).deliver_now
	  end

      # Returns true if a password reset has expired.
	  def password_reset_expired?
	    reset_sent_at < 2.hours.ago
	  end

    # Creates and assigns the default cook book.
    def create_favorites
       self.cook_books << CookBook.new(name: "Favorites", description: "This recipes I love!")
    end  	  

private

	 # Converts email to all lower-case.
	def downcase_email
	  self.email = email.downcase
	end

	def strip_whitespace
	  self.email = self.email.strip unless self.email.nil?
	  self.password = self.password.strip unless self.password.nil?
	  self.password_confirmation = self.password_confirmation.strip unless self.password_confirmation.nil?
	end

	# Creates a URL safe activation digest.
	def create_activation_digest
	  self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
	end
end
