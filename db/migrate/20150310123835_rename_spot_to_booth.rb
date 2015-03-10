class RenameSpotToBooth < ActiveRecord::Migration
  def change
    rename_table :spots, :booths

    rename_column :companies, :first_day_spot, :first_day_booth
    rename_column :companies, :second_day_spot, :second_day_booth
  end
end
