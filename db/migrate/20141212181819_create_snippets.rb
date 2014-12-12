class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.belongs_to :post, index: true, null: false
      t.text :source
      t.string :gist_url

      t.timestamps
    end
  end
end
