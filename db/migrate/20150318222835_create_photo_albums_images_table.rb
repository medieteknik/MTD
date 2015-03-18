class CreatePhotoAlbumsImagesTable < ActiveRecord::Migration
  def change
    create_table :photo_albums_images_tables, :id => false do |t|
      t.references :photo_album, :image
    end
  end
end
