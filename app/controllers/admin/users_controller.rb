class Admin::UsersController < Admin::AdminController
  add_breadcrumb 'Users', :admin_users_path

  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all.order(id: :asc)
  end

  def new
    add_breadcrumb 'New user', :new_admin_user_path
    @user = User.new
  end

  def create
    add_breadcrumb 'New user', :new_admin_user_path
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    add_breadcrumb 'Edit', edit_admin_user_path(@user)
  end

  def show
  end

  def update
    if user_params[:password].blank?
      update_params = user_params_without_password
    else
      update_params = user_params
    end

    the_roles = []
    the_roles = Role.find(user_params[:role_ids]) if !user_params[:role_ids].nil?

    if @user.update_attributes(update_params) and @user.roles.replace(the_roles)
      flash[:notice] = "Successfully updated user " + @user.name + "."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, {:role_ids => []})
    end
    def user_params_without_password
      params.require(:user).permit(:id, :name, :email, {:role_ids => []})
    end

    # Get the sought user once
    def set_user
      @user = User.find(params[:id])
      add_breadcrumb @user.name, admin_user_path(@user)
    end

    # Get roles accessible by the current user
    def accessible_roles
      @accessible_roles = Role.accessible_by(current_ability,:read)
    end
end
