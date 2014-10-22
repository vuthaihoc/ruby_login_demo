class ApplicationController < ActionController::Base
  #includes
  include ApplicationHelper
  include SessionsHelper
  include UsersHelper

  #Hash of action will be require login and how to check if not only logined, may be is_me, or created_by_me
  #If only require login, value should be (Symbol):all or (String)all
  #If not only require login, a method must be define with each value of hash key.
  # @todo : suport quick setting by define an array
  #attr_accessor :action_require_login

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before/after filters
  after_filter do
    I18n.exception_handler.store_missing_translations unless Rails.env.production?
  end

  before_action :login_require_check


  #initialize
  def initialize
    super
    @action_require_login = {}
  end


	private

	def login_require_check
    setting_language
    #
    unless @action_require_login.nil?
      requesting_action = params[:action] # get current action
        if @action_require_login.has_key?(requesting_action.to_sym) # check if this action require login
            more_checking_function = @action_require_login[requesting_action.to_sym]
            if signed_in? # 
                #flash[:warning] = "logined"
                if more_checking_function != :all && self.respond_to?(more_checking_function)
                  unless self.send(more_checking_function)
                    flash[:error] = t("You are not enough permission to access this section") 
                    redirect_to current_user
                  end
                end
            else
                flash[:error] = t("You must be logged in to access this section") 
                redirect_to user_signin_path
            end
        end
    end
    #if signed_in? == false 
      #flash[:error] = t("You must be logged in to access this section") 
      #redirect_to user_signin_path
    #end
  end
  #some default filter after login requred ok
  def admin_only
    if is_admin? 
      return true
    else
      return false 
    end
  end

  
end
