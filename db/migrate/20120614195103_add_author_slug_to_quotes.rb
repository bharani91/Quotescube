class AddAuthorSlugToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :author_slug, :string
    remove_index :quotes, :author
    add_index :quotes, :author_slug
  end
end
