class CreateImagesVirtualcollections < ActiveRecord::Migration
  def change
    create_table :images_virtualcollections, :id => false do |t|
      t.references :image, :virtualcollection
    end

    add_index :images_virtualcollections, [:image_id, :virtualcollection_id],
      name: "images_virtualcollections_index",
      unique: true
  end
end
