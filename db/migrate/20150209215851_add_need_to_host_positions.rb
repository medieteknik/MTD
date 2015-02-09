class AddNeedToHostPositions < ActiveRecord::Migration
  def change
    add_column :host_positions, :need, :integer, default: 0
  end
end
