class RenamePhotoAlbumsImagesTables < ActiveRecord::Migration
  def change
    rename_table :photo_albums_images_tables, :images_photo_albums
  end
end
