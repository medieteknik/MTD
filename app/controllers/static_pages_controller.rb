class StaticPagesController < ApplicationController
  def show
    render "static_pages/#{params[:page]}"
  end

  # make sure we catch that nasty missing template-error
  rescue_from ActionView::MissingTemplate do |exception|
    redirect_to home_path, :flash => { :error => "not found" }
  end
end
