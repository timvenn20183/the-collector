class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :site_id
      t.string :collection_id
      t.integer :visability
      t.boolean :active
      t.integer :year
      t.float :value
      t.float :cost
      t.string :slug
      t.string :alphabet_letter
      t.string :reference_number

      t.timestamps
    end
    add_index :items, :site_id
  end
end
