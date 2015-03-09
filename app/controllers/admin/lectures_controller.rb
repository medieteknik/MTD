class Admin::LecturesController < Admin::AdminController
  add_breadcrumb 'Lectures', :admin_lectures_path

  before_action :set_lecture, except: [:index, :new, :create]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @lectures = Lecture.all.order('name asc')
  end

  def new
    add_breadcrumb 'New lecture', :new_admin_lecture_path
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:notice] = "Successfully created lecture!"
      redirect_to edit_admin_lecture_path @lecture
    else
      add_breadcrumb 'New lecture', :new_admin_lecture_path
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @lecture.update_attributes(lecture_params)
      flash[:notice] = "Updated lecture."
      redirect_to edit_admin_lecture_path @lecture
    else
      render action: 'edit'
    end
  end

  def destroy
    if @lecture.destroy
      flash[:notice] = "Deleted lecture."
    else
      flash[:notice] = "Could not delete lecture."
    end
    redirect_to admin_lectures_path
  end

  # set a lecture's image, callback from s3
  # @http_method XHR POST
  # @url /admin/lectures/:id/image
  def image_callback
    @image = Image.create(image_params)
    @lecture.update(image: @image)
  end

  private
    def set_lecture
      @lecture = Lecture.find(params[:id])
      add_breadcrumb @lecture.name, admin_lecture_path(@lecture)
    end

    def lecture_params
      permitted = Lecture.globalize_attribute_names + [:name, :slug, :published, :start, :stop]
      params.require("lecture").permit(permitted)
    end

    def image_params
      params.permit(:url, :filetype, :filesize, :filepath, :unique_id)
    end
end
