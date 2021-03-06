class Admin::CompaniesController < Admin::AdminController
  add_breadcrumb 'Companies', :admin_companies_path

  before_action :set_company, only: [:edit, :update, :destroy, :show, :image_callback]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @companies = Company.all.order('name asc')
    @booths = Booth.all.order('number asc')
  end

  def new
    add_breadcrumb 'New company', :new_admin_company_path
    @company = Company.new
    5.times { @company.links.build }
  end

  def create
    @company = Company.new(company_params)
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

  def update_booths
    @booths = Booth.find(params[:booths_ids])
    @booths.each do |booth|
      booth.update_attributes!(booth_params[:booths][booth.id.to_s])
    end
    flash[:notice] = "Updated bootsh!"
    redirect_to admin_companies_path
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

    def booth_params
      params.permit(:booths => [:first_day, :second_day])
    end

    def company_params
      permitted = Company.globalize_attribute_names + [:name, :slug, :published,
        :sponsor, :first_day, :second_day, :first_day_booth_id, :second_day_booth_id,
        :extended, :color, :initials, { links_attributes: [:title, :url, :id] }]
      params.require("company").permit(permitted)
    end

    def image_params
      params.permit(:url, :filetype, :filesize, :filepath, :unique_id)
    end
end
