class LecturesController < ApplicationController
  load_and_authorize_resource

  def show
    @lecture = Lecture.where(slug: params[:slug]).first
  end

  def index
    @lectures = Lecture.all.where(published: true).order('start asc')
  end
end
