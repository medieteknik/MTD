class Admin::PagesController < Admin::AdminController
  # auth with respect to User, since we don't have a Page model
  load_and_authorize_resource User
  before_action :authenticate_user!

  def dashboard
    add_breadcrumb 'Dashboard', :admin_path
    @news_draft = News.where(status: 'draft')
    @unconfirmed_users = User.where('confirmed_at IS ?', nil)
    @student_expos = Studentexpo.limit(3).order(id: :desc)
    @suggestions = Suggestion.limit(3).order(id: :desc)
  end
end
