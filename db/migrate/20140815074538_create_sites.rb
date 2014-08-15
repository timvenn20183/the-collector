class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :code
      t.text :meta_keywords
      t.text :meta_description
      t.string :owner
      t.string :email
      t.string :password
      t.string :header
      t.string :tagline
      t.text :tracker_code

      t.timestamps
    end
  end
end
