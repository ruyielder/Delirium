class CreateCommentPosts < ActiveRecord::Migration
  def change
    create_table :comment_posts do |t|
      t.belongs_to :post, index: true, null: false
      t.string :email
      t.string :name
      t.string :url
      t.text :content
      t.boolean :blocked, null: false, default: false

      t.timestamps
    end
  end
end
