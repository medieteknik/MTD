class CreateNewsUsersTable < ActiveRecord::Migration
  def change
    create_table :news_users do |t|
      t.references :news, :user
    end
  end
end
