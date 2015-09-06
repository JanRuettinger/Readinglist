class AddKeywordToBooks < ActiveRecord::Migration
  def change
    add_column :books, :keyword, :text
  end
end
