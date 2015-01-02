class StaticPagesController < ApplicationController
  def show
    render "static_pages/#{params[:page]}"
  end

  def home
    @news = News.where('status = :status AND published_at <= :right_now', {status: 'public', right_now: DateTime.now}).order(published_at: :desc).limit(5)
  end

  # make sure we catch that nasty missing template-error
  rescue_from ActionView::MissingTemplate do |exception|
    redirect_to home_path, :flash => { :error => "not found" }
  end
end
