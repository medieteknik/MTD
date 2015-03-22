class AddColorAndInitialsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :color, :string
    add_column :companies, :initials, :string
  end
end
