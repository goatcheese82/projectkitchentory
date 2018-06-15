class CreateInventoryTable < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.belongs_to :user, index: true
      t.string :name
    end
  end
end
