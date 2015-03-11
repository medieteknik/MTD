class AddModeToBooth < ActiveRecord::Migration
  def change
    remove_column :booths, :extended
    add_column :booths, :mode, :integer
  end
end
