class CreateFieldoptionsImages < ActiveRecord::Migration
  def change
    create_table :fieldoptions_images, :id => false do |t|
      t.references :fieldoption, :image
    end

    add_index :fieldoptions_images, [:fieldoption_id, :image_id],
      name: "fieldoptions_images_index",
      unique: true
  end
end
