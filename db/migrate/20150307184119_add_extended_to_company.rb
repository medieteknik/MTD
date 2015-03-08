class AddExtendedToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :extended, :boolean
  end
end
