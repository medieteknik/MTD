class AddUserAndThumbnailToImage < ActiveRecord::Migration
  def change
    add_reference :images, :user, index: true
    add_foreign_key :images, :users
    add_column :images, :thumbnail, :string
  end
end
