class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }
  before_save { name.downcase! }
  has_many :articles, dependent: :destroy
  has_many :votes
  has_secure_password
end
