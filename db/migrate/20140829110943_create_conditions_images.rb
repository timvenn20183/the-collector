class CreateConditionsImages < ActiveRecord::Migration
  def change
    create_table :conditions_images, :id => false do |t|
      t.references :condition, :image
    end

    add_index :conditions_images, [:condition_id, :image_id],
      name: "conditions_images_index",
      unique: true
  end
end
