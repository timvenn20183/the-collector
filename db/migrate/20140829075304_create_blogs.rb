class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.datetime :publish_start
      t.datetime :publish_end
      t.boolean :draft, :default => true
      t.string :slug
      t.timestamps
    end
  end
end
