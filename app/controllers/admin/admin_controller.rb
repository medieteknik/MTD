class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_filter :check_admin_access

  layout "admin/layouts/admin_layout"

  # use semantic-ui's breadcrumbs
  add_breadcrumb 'Admin', '/admin'

  # allways check auth
  check_authorization

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
    def check_admin_access
      if cannot? :access_panel, User
        raise CanCan::AccessDenied.new("Not authorized to access the admin panel!", :access_panel, User)
      end
    end
end
