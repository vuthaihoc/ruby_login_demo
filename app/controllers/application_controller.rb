class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter do
    I18n.exception_handler.store_missing_translations unless Rails.env.production?
  end


  
end
