class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.text :note
      t.integer :site_id

      t.timestamps
    end
    add_index :categories, :site_id
  end
end
