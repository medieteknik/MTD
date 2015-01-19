class Admin::SuggestionsController < Admin::AdminController
  add_breadcrumb 'Suggestions', :admin_users_path

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @suggestions = Suggestion.all.order(id: :asc)
  end

  def destroy
    if Suggestion.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted suggestion."
      redirect_to admin_suggestions_path
    end
  end
end
