class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  # determine when to check auth
  check_authorization :unless => :do_not_check_authorization?

  # catch nasty access denied-messages
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to access_denied_redir
  end

  # make sure we dont need to set the locale each time we create a link
  def default_url_options(options={})
    { locale: I18n.locale }
  end

  private
    def do_not_check_authorization?
      respond_to?(:devise_controller?) or !request.original_url.downcase.include? "/admin"
    end
end
