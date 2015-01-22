class Admin::StudentexposController < Admin::AdminController
  add_breadcrumb 'Student Expo', :admin_studentexpos_path

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @studentexpos = Studentexpo.all.order(id: :asc)
  end
end
