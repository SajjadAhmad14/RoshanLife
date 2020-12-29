class Article < ApplicationRecord
  validates :title, :body, :category, :image, presence: true
  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :image
  validate :image_type
  def image_type
    errors.add(:image, 'needs to be a jpeg or png!') if !image.nil? && image.content_type.in?(%('image/jpg image/png'))
  end
end