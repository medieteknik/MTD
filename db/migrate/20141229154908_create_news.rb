class CreateNews < ActiveRecord::Migration
  def up
    create_table :news do |t|
      t.string :status
      t.datetime :published_at

      t.timestamps

      News.create_translation_table! title: :string, content: :text
    end
  end

  def down
    drop_table :news
  end
end
