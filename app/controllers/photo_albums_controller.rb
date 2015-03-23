class PhotoAlbumsController < ApplicationController
  load_and_authorize_resource

  def index
    @albums  = PhotoAlbum.all
  end
end
