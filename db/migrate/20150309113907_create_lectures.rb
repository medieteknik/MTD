class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :title
      t.text :description
      t.references :image, index: true
      t.datetime :start
      t.datetime :stop
      t.boolean :published

      t.timestamps null: false
    end
    add_foreign_key :lectures, :images
  end
end
