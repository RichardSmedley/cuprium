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


#  def extract_locale_from_subdomain
#    parsed_locale = request.subdomains.first
#    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
#  end


end
