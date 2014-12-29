class AddLocaleToVersions < ActiveRecord::Migration
  def change
    change_table :versions do |t|
      t.string :locale
    end
  end
end
