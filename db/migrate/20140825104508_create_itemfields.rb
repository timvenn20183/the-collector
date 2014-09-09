class CreateItemfields < ActiveRecord::Migration
  def change
    create_table :itemfields do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
