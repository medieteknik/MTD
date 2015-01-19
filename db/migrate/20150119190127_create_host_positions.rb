class CreateHostPositions < ActiveRecord::Migration
  def up
    create_table :host_positions do |t|
      t.timestamps
    end
    HostPosition.create_translation_table! :position => :string
  end

  def down
    drop_table :host_positions
    HostPosition.drop_translation_table!
  end
end
