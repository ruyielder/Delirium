class AddTagLineToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :tag_line, :string
  end
end
