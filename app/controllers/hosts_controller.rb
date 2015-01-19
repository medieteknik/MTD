class HostsController < ApplicationController
  load_and_authorize_resource

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)

    if @host.save
      flash[:notice] = t('host.created')
      redirect_to @host
    else
      render 'new'
    end
  end

  private
    def host_params
      params.require(:host).permit(:name, :liuid, :phone, :year, :reason, :size, :member, :banquet, :first, :second, :third, :other, :allergies)
    end
end
