class AddPositionToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :position, :integer, :default => 0
  end
end
