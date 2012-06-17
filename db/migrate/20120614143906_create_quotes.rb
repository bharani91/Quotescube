class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote_text
      t.string :author
      t.string :context
      t.string :category

      t.timestamps
    end
  end
end
