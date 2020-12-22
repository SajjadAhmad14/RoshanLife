class AddUserAndArticleToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :user, null: false, foreign_key: true, index: true
    add_reference :votes, :article, null: false, foreign_key: true, index: true
  end
end
