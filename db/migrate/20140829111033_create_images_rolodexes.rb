class CreateImagesRolodexes < ActiveRecord::Migration
  def change
    create_table :images_rolodexes, :id => false do |t|
      t.references :image, :rolodex
    end

    add_index :images_rolodexes, [:image_id, :rolodex_id],
      name: "images_rolodexes_index",
      unique: true
  end
end
