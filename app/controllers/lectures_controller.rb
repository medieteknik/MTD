class LecturesController < ApplicationController
  load_and_authorize_resource

  def show
    @lecture = Lecture.where(slug: params[:slug]).first
  end

  def index
		@lectures_one = Lecture.all.where(published: true,
			start: (Date.new(2016, 4, 6).beginning_of_day)..(Date.new(2016, 4, 6).end_of_day)).order('start asc')
		@lectures_two = Lecture.all.where(published: true,
			start: (Date.new(2016, 4, 7).beginning_of_day)..(Date.new(2016, 4, 7).end_of_day)).order('start asc')
    #@lectures = Lecture.all.where(published: true)
  end
end
