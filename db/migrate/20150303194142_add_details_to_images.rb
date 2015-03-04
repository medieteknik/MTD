class AddDetailsToImages < ActiveRecord::Migration
  def change
    add_column :images, :unique_id, :string
    add_column :images, :filetype, :string
    add_column :images, :filepath, :string
    add_column :images, :filesize, :integer

    rename_column :images, :original_url, :url
  end
end
