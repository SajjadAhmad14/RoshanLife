class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes
  has_one_attached :image
end
