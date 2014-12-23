class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel, :destroy]
  skip_before_filter :require_no_authentication

  def check_permissions
    logger.debug "Checking user permissions for #{params}"
    authorize! [:create, :destroy], resource
  end
end
