class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @news = News.where('status = :status AND published_at <= :right_now', {status: 'public', right_now: DateTime.now}).order(published_at: :desc).paginate(:page => params[:page], :per_page => 10)
    respond_with(@news)
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    respond_with(@news)
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.users << current_user
    @news.status = 'draft'
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    respond_with(@news)
  end

  def destroy
    if @news.destroy
      flash[:notice] = t('news.deleted')
      redirect_to news_index_path
    end
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      permitted = News.globalize_attribute_names + [:published_at]
      params.require(:news).permit(*permitted)
    end
end
