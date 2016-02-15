class StudentexposController < ApplicationController
  load_and_authorize_resource

  def new
    @studentexpo ||= Studentexpo.new
  end

  def create
    @studentexpo = Studentexpo.new(studentexpo_params)

    if @studentexpo.save
      flash[:notice] = t('studentexpos.created')
      redirect_to show_studentexpo_path(@studentexpo.id, @studentexpo.liuid)
    else
      render 'new'
    end
  end

  def show
    @studentexpo = Studentexpo.where(id: params[:id], liuid: params[:liuid]).first
  end

  private
    def studentexpo_params
      params.require(:studentexpo).permit(:title, :name, :liuid, :description, :need_computer, :members)
    end

end
