class CreateCommentsItems < ActiveRecord::Migration
  def change
    create_table :comments_items, :id => false do |t|
      t.references :comment, :item
    end

    add_index :comments_items, [:comment_id, :item_id],
      name: "comments_items_index",
      unique: true
  end
end
