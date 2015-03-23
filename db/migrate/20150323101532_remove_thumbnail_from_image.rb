class RemoveThumbnailFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :thumbnail
  end
end
