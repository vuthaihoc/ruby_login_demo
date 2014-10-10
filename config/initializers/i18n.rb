# config/initializers/locale.rb
I18n.exception_handler = I18n::Workflow::ExceptionHandler.new unless Rails.env.production?
I18n.backend.class.send(:include, I18n::Backend::Fallbacks)
I18n.backend.class.send(:include, I18n::Backend::Cascade)
I18n.backend.class.send(:include, I18n::Workflow::AlwaysCascade)
I18n.backend.class.send(:include, I18n::Workflow::ExplicitScopeKey)

