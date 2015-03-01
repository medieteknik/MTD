class CreateCompaniesUsers < ActiveRecord::Migration
  def change
    create_table :companies_users, id: false do |t|
      t.belongs_to :company, index: true
      t.belongs_to :user, index: true
    end
  end
end
