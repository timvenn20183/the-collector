class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :collection_id
      t.integer :visability
      t.boolean :active
      t.integer :year
      t.float :value
      t.float :cost
      t.string :slug
      t.string :alphabet_letter
      t.string :reference
      t.text :note
      t.string :search_string

      t.timestamps
    end
  end
end
