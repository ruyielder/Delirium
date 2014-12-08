class RenameFieldsOfPostTags < ActiveRecord::Migration
  def change
    rename_column :post_tags, :post, :post_id
    rename_column :post_tags, :tag, :tag_id
  end
end
