class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # make sure we dont need to set the locale each time we create a link
  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
