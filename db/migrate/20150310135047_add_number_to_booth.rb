class AddNumberToBooth < ActiveRecord::Migration
  def change
    add_column :booths, :number, :integer
  end
end
