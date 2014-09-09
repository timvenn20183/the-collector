class CreateBlogsImages < ActiveRecord::Migration
  def change
    create_table :blogs_images, :id => false do |t|
      t.references :blog, :image
    end

    add_index :blogs_images, [:blog_id, :image_id],
      name: "blogs_images_index",
      unique: true
  end
end
