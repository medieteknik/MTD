class Admin::PhotoAlbumsController < Admin::AdminController
  add_breadcrumb 'Photos', :admin_photo_albums_path

  before_action :set_photo_album, only: [:edit, :update, :destroy, :image_callback]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index

  end

  private
    def set_photo_album

    end
end
