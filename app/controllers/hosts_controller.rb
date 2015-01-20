class HostsController < ApplicationController
  load_and_authorize_resource

  def new
    @host ||= Host.new
  end

  def create
    @host = Host.new(host_params)

    if @host.save
      flash[:notice] = t('hosts.created')
      redirect_to show_host_path(@host.id, @host.liuid)
    else
      render 'new'
    end
  end

  def show
    @host = Host.where(id: params[:id], liuid: params[:liuid]).first
  end

  private
    def host_params
      params.require(:host).permit(:name, :liuid, :phone, :year, :reason, :size, :member, :banquet, :first, :second, :third, :other, :allergies)
    end
end
