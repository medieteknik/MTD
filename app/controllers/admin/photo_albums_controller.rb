class Admin::PhotoAlbumsController < Admin::AdminController
  add_breadcrumb 'Photos', :admin_photo_albums_path

  before_action :set_photo_album, only: [:edit, :update, :destroy, :image_callback]
  before_action :authenticate_user!
  load_and_authorize_resource

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

  def create
    @album = PhotoAlbum.new(photo_album_params)

    if @album.save!
      flash[:notice] = "Album created!"
      redirect_to admin_photo_albums_path
    else
      flash[:notice] = "Could not create album!"
      render 'new'
    end
  end

  def update
    if @album.update(photo_album_params)
      flash[:notice] = "Updated photo album"
      redirect_to edit_admin_photo_album_path(@album)
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

  private
    def set_photo_album
      @album = PhotoAlbum.find(params[:id])
      add_breadcrumb 'Photo album ' + @album.title, edit_admin_photo_album_path(@album)
    end

    def photo_album_params
      permitted = PhotoAlbum.globalize_attribute_names
      params.require(:photo_album).permit(*permitted)
    end
end
