class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization :unless => :do_not_check_authorization?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  # make sure we dont need to set the locale each time we create a link
  def default_url_options(options={})
    { locale: I18n.locale }
  end

  private
    def do_not_check_authorization?
      logger.debug "Matching request for auth check: " + request.original_url.downcase
      respond_to?(:devise_controller?) or !request.original_url.downcase.include? "/admin"
    end
end
