class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { locale: I18n.locale }
end


#class SomeController < ApplicationController
  def some_action
    http_accept_language.user_preferred_languages # => %w(nl-NL nl-BE nl cy-cy cy en-GB en-US en)
    available = %w(en en-GB nl cy)
    http_accept_language.preferred_language_from(available) # => 'nl'

    http_accept_language.user_preferred_languages # => %w(en-GB)
    available = %w(en en-GB en-US)
    http_accept_language.compatible_language_from(available) # => 'en-GB'

    http_accept_language.user_preferred_languages # => %w(cy cy-cy nl-NL nl-BE nl en-US en)
    available = %w(cy fr en nl) # This could be from I18n.available_locales
    http_accept_language.preferred_language_from(available) # => 'cy'
  end
#end

#  def extract_locale_from_subdomain
#    parsed_locale = request.subdomains.first
#    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
#  end


end
