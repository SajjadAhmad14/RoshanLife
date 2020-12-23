class User < ApplicationRecord
  validates :name, presence: true
  before_save { name.downcase! }
  has_many :articles
  has_many :votes
end
