class CreateImagePosts < ActiveRecord::Migration
  def change
    create_table :image_posts do |t|
      t.belongs_to :post, index: true, null: false
      t.string :image
      t.string :basename

      t.timestamps
    end
  end
end