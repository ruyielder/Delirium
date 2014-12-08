class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.integer :post, :null => false
      t.integer :tag, :null => false

      t.timestamps
    end
    add_index :post_tags, :post
    add_index :post_tags, :tag
    add_index :post_tags, [:post, :tag], unique: true
  end
end
