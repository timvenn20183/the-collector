class CreateVirtualcollections < ActiveRecord::Migration
  def change
    create_table :virtualcollections do |t|
      t.string :name
      t.string :slug
      t.integer :site_id
      t.text :note

      t.timestamps
    end
      add_index :virtualcollections, :site_id
  end
end
