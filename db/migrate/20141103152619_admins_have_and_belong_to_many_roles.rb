class AdminsHaveAndBelongToManyRoles < ActiveRecord::Migration
  def self.up
    create_table :roles_admins, :id => false do |t|
      t.references :role, :admin
    end
  end

  def self.down
    drop_table :roles_admins
  end
end
