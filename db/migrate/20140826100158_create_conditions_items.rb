class CreateConditionsItems < ActiveRecord::Migration
  def change
    create_table :conditions_items, :id => false do |t|
      t.references :condition, :item
    end

    add_index :conditions_items, [:condition_id, :item_id],
      name: "conditions_items_index",
      unique: true
  end
end
