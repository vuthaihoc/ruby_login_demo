class User < ActiveRecord::Base

	#validate
	validates :name, presence: true
	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true , presence: true, email: true
	validates :password, confirmation: true, presence: true
  	validates :password_confirmation, presence: true
  	#relation
  	has_one :group

  	#make new remember token after create new user
  	before_create :create_remember_token
  	#before save a user info
  	before_save { self.email = email.downcase }

  	def authenticate(password)
  		if self.password == password
  			return true
  		else return false
  		end
  	end

  	def User.new_remember_token
	    SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end





  	private

	  def create_remember_token
	    self.remember_token = User.digest(User.new_remember_token)
	  end
end
