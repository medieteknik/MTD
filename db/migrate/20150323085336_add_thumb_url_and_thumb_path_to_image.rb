class AddThumbUrlAndThumbPathToImage < ActiveRecord::Migration
  def change
    add_column :images, :thumb_url, :string
    add_column :images, :thumb_path, :string
  end
end
