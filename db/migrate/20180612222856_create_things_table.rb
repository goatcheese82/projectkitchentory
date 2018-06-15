class CreateThingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :things do |t|
      t.belongs_to :inventory, index: true
      t.string :title
      t.integer :quantity
      t.text :description
    end
  end
end
