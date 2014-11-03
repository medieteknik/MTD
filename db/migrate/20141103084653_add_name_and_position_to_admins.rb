class AddNameAndPositionToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :position, :string
  end
end
