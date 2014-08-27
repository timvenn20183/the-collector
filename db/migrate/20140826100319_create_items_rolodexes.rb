class CreateItemsRolodexes < ActiveRecord::Migration
  def change
    create_table :items_rolodexes, :id => false do |t|
      t.references :item, :rolodex
    end

    add_index :items_rolodexes, [:item_id, :rolodex_id],
      name: "items_rolodexes_index",
      unique: true
  end
end
