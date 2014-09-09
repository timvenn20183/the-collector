class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.text :content
      t.string :rawimage
      t.string :md5

      t.timestamps
    end
  end
end
