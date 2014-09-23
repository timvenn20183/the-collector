class CreateItemsRelateditems < ActiveRecord::Migration
  def change
    create_table :items_relateditems, :id => false do |t|
      t.references :item, :relateditem
    end

    add_index :items_relateditems, [:item_id, :relateditem_id],
      name: "items_relateditems_index",
      unique: true
  end
end
