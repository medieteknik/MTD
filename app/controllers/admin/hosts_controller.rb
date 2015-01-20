class Admin::HostsController < Admin::AdminController
  add_breadcrumb 'Hosts', :admin_hosts_path

  # before_action :set_host, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @hosts = Host.all
  end
end
