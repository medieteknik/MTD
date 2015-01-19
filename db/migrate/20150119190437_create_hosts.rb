class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :liuid
      t.string :phone
      t.integer :year
      t.text :reason
      t.string :size
      t.boolean :member
      t.boolean :banquet
      t.string :allergies
      t.text :other

      # these are references to host positions
      t.integer :first
      t.integer :second
      t.integer :third

      t.timestamps
    end
  end
end
