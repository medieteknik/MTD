class CreatePhotoAlbums < ActiveRecord::Migration
  def up
    create_table :photo_albums do |t|
      t.boolean :published

      t.timestamps null: false
    end
    PhotoAlbum.create_translation_table! :title => :string
  end

  def down
    drop_table :photo_albums
    PhotoAlbum.drop_translation_table!
  end
end
