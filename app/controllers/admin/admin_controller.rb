class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "admin/layouts/admin_layout"

  # use semantic-ui's breadcrumbs
  add_breadcrumb 'Admin', '/admin'

  # allways check auth
  check_authorization

  # catch nasty access denied-messages
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  # make sure we dont need to set the locale each time we create a link
  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
