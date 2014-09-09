class CreateVirtualcollections < ActiveRecord::Migration
  def change
    create_table :virtualcollections do |t|
      t.string :name
      t.string :slug
      t.text :note

      t.timestamps
    end
  end
end
