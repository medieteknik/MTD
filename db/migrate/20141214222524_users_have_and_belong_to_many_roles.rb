class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def change
    t.references :role, :user
  end
end
