class CreateRolodexes < ActiveRecord::Migration
  def change
    create_table :rolodexes do |t|
      t.string :name
      t.integer :rolodex_type
      t.string :email
      t.string :cell
      t.string :tel
      t.text :history
      t.text :address
      t.string :slug
      t.integer :site_id

      t.timestamps
    end
	add_index :rolodexes, :site_id
  end
end
