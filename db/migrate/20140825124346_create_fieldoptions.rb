class CreateFieldoptions < ActiveRecord::Migration
  def change
    create_table :fieldoptions do |t|
      t.string :name
      t.integer :itemfield_id
      t.string :slug

      t.timestamps
    end
    add_index :fieldoptions, :itemfield_id
  end
end
