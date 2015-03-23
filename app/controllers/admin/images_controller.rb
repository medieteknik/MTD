class Admin::ImagesController < Admin::AdminController
  before_action :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource only: :image_callback

  def destroy
    image = Image.find(params[:id])
    if image.destroy!
      flash[:notice] = "Deleted image!"
    else
      flash[:notice] = "Could not deleted image!"
    end
    redirect_to admin_photo_album_path(params[:photo_album_id])
  end
end
