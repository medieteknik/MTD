class Admin::CompaniesController < Admin::AdminController
  add_breadcrumb 'Companies', :admin_companies_path

  before_action :set_company, only: [:edit, :update, :destroy, :show, :image_callback]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @companies = Company.all.order('name asc')
  end

  def new
    add_breadcrumb 'New company', :new_admin_company_path
    @company = Company.new
    5.times { @company.links.build }
  end

  def create
    @company = Company.new(company_params)
    # 5.times do
    #   @company.links << Link.create
    # end
    if @company.save
      flash[:notice] = "Successfully created company!"
      redirect_to edit_admin_company_path @company
    else
      add_breadcrumb 'New company', :new_admin_company_path
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @company.update_attributes(company_params)
      flash[:notice] = "Updated company."
      redirect_to edit_admin_company_path @company
    else
      render action: 'edit'
    end
  end

  def destroy
    if @company.destroy
      flash[:notice] = "Deleted company."
    else
      flash[:notice] = "Could not delete company."
    end
    redirect_to admin_companies_path
  end

  # set a company's image, callback from s3
  # @http_method XHR POST
  # @url /admin/companies/:id/image
  def image_callback
    @image = Image.create(image_params)
    @company.update(image: @image)
  end

  private
    def set_company
      @company = Company.find(params[:id])
      add_breadcrumb @company.name, edit_admin_company_path(@company)
    end

    def company_params
      # asda
      permitted = Company.globalize_attribute_names + [:name, :slug, :published,
        :sponsor, :first_day, :second_day, :first_day_spot, :second_day_spot,
        :extended, { links_attributes: [:title, :url, :id] }]
      params.require("company").permit(permitted)
    end

    def image_params
      params.permit(:url, :filetype, :filesize, :filepath, :unique_id)
    end
end
