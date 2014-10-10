class User < ActiveRecord::Base
	validates :name, presence: true
	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true , presence: true, email: true
	validates :password, confirmation: true, presence: true
  	validates :password_confirmation, presence: true
end
