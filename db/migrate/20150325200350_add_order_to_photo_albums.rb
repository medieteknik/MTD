class AddOrderToPhotoAlbums < ActiveRecord::Migration
  def change
    add_column :photo_albums, :order, :integer, default: 0
  end
end
