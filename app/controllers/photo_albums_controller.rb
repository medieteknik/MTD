class PhotoAlbumsController < ApplicationController
  load_and_authorize_resource

  def index
    @albums  = PhotoAlbum.all.order(order: :asc)
  end
end
