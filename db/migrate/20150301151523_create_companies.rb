class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.string :sponsor
      t.boolean :first_day
      t.boolean :second_day
      t.integer :first_day_spot
      t.integer :second_day_spot
      t.boolean :published
      t.references :image, index: true

      t.timestamps null: false
    end
    add_foreign_key :companies, :images
    Company.create_translation_table! :description => :text, :looking_for => :string
  end

  def down
    drop_table :posts
    Company.drop_translation_table!
  end
end
