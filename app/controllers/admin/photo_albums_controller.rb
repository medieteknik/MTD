class Admin::PhotoAlbumsController < Admin::AdminController
  add_breadcrumb 'Photos', :admin_photo_albums_path

  before_action :set_photo_album, except: [:index, :new, :create]
  before_action :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource only: :image_callback

  def index
    @albums  = PhotoAlbum.all
  end

  def new
    add_breadcrumb 'New photo album', new_admin_photo_album_path
    @album = PhotoAlbum.new
  end

  def edit
    add_breadcrumb 'Edit', edit_admin_photo_album_path(@album)
  end

  def show
  end

  def create
    @album = PhotoAlbum.new(photo_album_params)

    if @album.save!
      flash[:notice] = "Album created!"
      redirect_to admin_photo_album_path @album
    else
      flash[:notice] = "Could not create album!"
      render 'new'
    end
  end

  def update
    if @album.update(photo_album_params)
      flash[:notice] = "Updated photo album"
      redirect_to admin_photo_album_path(@album)
    else
      flash[:notice] = "Could not update album"
      render 'edit'
    end
  end

  def destroy
    if @album.destroy!
      flash[:notice] = "Album deleted!"
    else
      flash[:notice] = "Album could not be deleted!"
    end
    redirect_to admin_photo_albums_path
  end

  def image_callback
    # make sure user are allowed to create photo
    authorize! :create, Image

    logger.debug 'saving image'
    @image = Image.new(image_params)
    logger.debug @image
    @image.user = current_user
    @album.images << @image
  end

  private
    def set_photo_album
      @album = PhotoAlbum.find(params[:id])
      add_breadcrumb 'Photo album ' + @album.title, admin_photo_album_path(@album)
    end

    def photo_album_params
      permitted = PhotoAlbum.globalize_attribute_names
      params.require(:photo_album).permit(*permitted)
    end

    def image_params
      params.permit(:url, :filetype, :filesize, :filepath, :unique_id)
    end
end
