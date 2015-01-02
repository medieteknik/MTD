class Admin::NewsController < Admin::AdminController
  add_breadcrumb 'News', :admin_news_index_path

  before_action :set_news, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @news = @news.all.order(published_at: :desc, id: :desc)
  end

  def new
    add_breadcrumb 'New news entry', :new_admin_news_path
    @news = News.new
    @news.users << current_user
    @news.status = 'public'
    @news.published_at = DateTime.current
  end

  def create
    @news = News.new(news_params)
    @news.users << User.find(news_params[:user_ids])
    if @news.save
      flash[:notice] = "Successfully created news entry"
      redirect_to edit_admin_news_path(@news)
    else
      add_breadcrumb 'New news entry', :new_admin_news_path
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @news.update_attributes(news_params) and @news.users.replace(User.find(news_params[:user_ids]))
      flash[:notice] = "Updated news entry."
      redirect_to edit_admin_news_path(@news)
    else
      render action: 'edit'
    end
  end

  def destroy
    if @news.destroy
      flash[:notice] = "Deleted news entry."
      redirect_to admin_news_index_path
    end
  end

  private
    # load the asked for news only once
    def set_news
      @news = News.find(params[:id])
      add_breadcrumb 'News entry #' + @news.id.to_s, edit_admin_news_path(@news)
    end

    def news_params
      permitted = News.globalize_attribute_names + [:id, :published_at, :status, {user_ids: []}]
      params.require(:news).permit(*permitted)
    end
end
