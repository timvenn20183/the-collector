class CreateImagesItems < ActiveRecord::Migration
  def change
    create_table :images_items, :id => false do |t|
      t.references :image, :item
    end

    add_index :images_items, [:image_id, :item_id],
      name: "images_items_index",
      unique: true
  end
end
