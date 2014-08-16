class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :slug
      t.integer :site_id    

      t.timestamps
    end
    add_index :conditions, :site_id
  end
end
