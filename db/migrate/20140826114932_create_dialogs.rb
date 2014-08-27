class CreateDialogs < ActiveRecord::Migration
  def change
    create_table :dialogs do |t|
      t.string :code
      t.string :content
      t.integer :site_id

      t.timestamps
    end
    add_index :dialogs, :site_id
  end
end
