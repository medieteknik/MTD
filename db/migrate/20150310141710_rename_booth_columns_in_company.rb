class RenameBoothColumnsInCompany < ActiveRecord::Migration
  def change
    rename_column :companies, :first_day_booth, :first_day_booth_id
    rename_column :companies, :second_day_booth, :second_day_booth_id
  end
end
