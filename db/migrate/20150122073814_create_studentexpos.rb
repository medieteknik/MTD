class CreateStudentexpos < ActiveRecord::Migration
  def change
    create_table :studentexpos do |t|
      t.string :title
      t.text :description
      t.string :members
      t.string :liuid
      t.string :name
      t.string :course
      t.boolean :need_computer

      t.timestamps
    end
  end
end
