class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :validator
      t.string :slot_height
      t.string :num_transactions
      t.boolean :skipped
      t.timestamp :ts
      t.decimal :failrate
      t.string :blockhash
      t.string :transactions

      t.timestamps
    end
  end
end
