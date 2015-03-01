class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.boolean :first_day
      t.boolean :second_day

      t.timestamps null: false
    end
  end
end
