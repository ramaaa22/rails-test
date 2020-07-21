# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :serial
      t.string :api_key
      t.timestamps
    end
    add_index :devices, :serial, unique: true
  end
end
