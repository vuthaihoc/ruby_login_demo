class SessionsController < ApplicationController
	#login
	def new
		#@user = User.new
	end
	
	def create
		user = User.find_by(email: params[:sessions][:email].downcase)

		if user && user.authenticate(params[:sessions][:password])

			sign_in user

			redirect_to user

			return 

		else

			flash[:error] = "Invalid email/password combination"

		end
		render :new
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
