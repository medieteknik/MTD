class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.belongs_to :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :links, :companies
  end
end
