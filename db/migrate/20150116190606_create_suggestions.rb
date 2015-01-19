class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :content
      t.string :email
      t.boolean :seen

      t.timestamps
    end
  end
end
