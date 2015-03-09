class RecreateLectures < ActiveRecord::Migration
  def up
    drop_table :lectures

    create_table :lectures do |t|
      t.string :name
      t.string :slug
      t.datetime :start
      t.datetime :stop
      t.boolean :published
      t.references :image, index: true

      t.timestamps null: false
    end
    add_foreign_key :lectures, :images
    Lecture.create_translation_table! :description => :text, :title => :string
  end

  def down
    drop_table :lectures
    Lecture.drop_translation_table!
  end
end
