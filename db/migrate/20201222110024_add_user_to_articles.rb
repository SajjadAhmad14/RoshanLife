class AddUserToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, null: false, foreign_key: true, index: true
  end
end
