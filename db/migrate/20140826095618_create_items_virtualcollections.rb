class CreateItemsVirtualcollections < ActiveRecord::Migration
  def change
    create_table :items_virtualcollections, :id => false do |t|
      t.references :item, :virtualcollection
    end

    add_index :items_virtualcollections, [:item_id, :virtualcollection_id],
      name: "items_virtualcollections_index",
      unique: true
  end
end
