class AddExtendedToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :extended, :boolean
  end
end
