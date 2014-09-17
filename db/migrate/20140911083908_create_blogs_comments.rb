class CreateBlogsComments < ActiveRecord::Migration
  def change
    create_table :blogs_comments, :id => false do |t|
      t.references :blog, :comment
    end

    add_index :blogs_comments, [:blog_id, :comment_id],
      name: "blogs_comments_index",
      unique: true
  end
end
