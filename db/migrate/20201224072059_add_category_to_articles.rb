class AddCategoryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :category, null: false, foreign_key: true, index: true
  end
end
