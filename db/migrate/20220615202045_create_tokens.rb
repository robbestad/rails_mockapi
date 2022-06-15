class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :name
      t.string :volume
      t.string :change
      t.string :image_url
      t.string :price

      t.timestamps
    end
  end
end
