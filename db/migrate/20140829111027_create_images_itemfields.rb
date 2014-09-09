class CreateImagesItemfields < ActiveRecord::Migration
  def change
    create_table :images_itemfields, :id => false do |t|
      t.references :image, :itemfield
    end

    add_index :images_itemfields, [:image_id, :itemfield_id],
      name: "images_itemfields_index",
      unique: true
  end
end
