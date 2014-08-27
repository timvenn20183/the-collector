class CreateItemfields < ActiveRecord::Migration
  def change
    create_table :itemfields do |t|
      t.string :name
      t.string :slug
      t.integer :site_id

      t.timestamps
    end
    add_index :itemfields, :site_id
  end
end
