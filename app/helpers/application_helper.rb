module ApplicationHelper
	def setting_language
		#trigger to setting locale
	    current_locale = session[:locale] || I18n.default_locale
	    if I18n.available_locales.include? current_locale.to_sym
	      I18n.locale = current_locale
	      session[:locale] = current_locale
	    else
	      flash[:warning_language_locale] = t("Locale code was wrong!")
	      session[:locale] = I18n.default_locale
	      I18n.locale = I18n.default_locale
	    end
	end
end
