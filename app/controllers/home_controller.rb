class HomeController < ApplicationController
	#home controller for static pages
	def index
		@users = User.all()
  	end
  	def set_locale
		new_locale = params[:locale]
		session[:locale] = new_locale

	    if request.env['HTTP_REFERER'].nil?
			redirect_to root_path
		else 
			redirect_to :back
		end
  	end
end
