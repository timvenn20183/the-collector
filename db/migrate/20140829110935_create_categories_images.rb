class CreateCategoriesImages < ActiveRecord::Migration
  def change
    create_table :categories_images, :id => false do |t|
      t.references :category, :image
    end

    add_index :categories_images, [:category_id, :image_id],
      name: "categories_images_index",
      unique: true
  end
end
