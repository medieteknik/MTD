class Admin::HostsController < Admin::AdminController
  add_breadcrumb 'Hosts', :admin_hosts_path

  before_action :set_host, only: [:destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @hosts = Host.all
  end

  def positions
    @positions = HostPosition.order(:id).all
  end

  def destroy
    if @host.destroy
      flash[:notice] = "Host deleted."
    else
      flash[:notice] = "Host could not be deleted. Contact webby!"
    end
    redirect_to admin_hosts_path
  end

  private
    def set_host
      @host = Host.find(params[:id])
    end
end
