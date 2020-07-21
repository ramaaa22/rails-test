class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.integer :uptime
      t.float :load
      t.integer :free_mem
      t.belongs_to :device
      t.timestamps
    end
  end
end
