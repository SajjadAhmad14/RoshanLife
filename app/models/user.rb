class User < ApplicationRecord
  validates :name, presence: true
  has_many :articles
  has_many :votes
end
