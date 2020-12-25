class Article < ApplicationRecord
  validates :title, :body, :category, :image, presence: true
  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :image
end
