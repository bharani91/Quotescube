class AddPermalinkToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :permalink, :string
    add_index :quotes, :permalink
    add_index :quotes, :author
    add_index :quotes, :category
  end
end
