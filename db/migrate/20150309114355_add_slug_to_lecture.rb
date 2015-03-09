class AddSlugToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :slug, :string
  end
end
