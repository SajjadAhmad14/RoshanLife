class Article < ApplicationRecord
  validates :title, :body, :category, presence: true
  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :image
  validate :image_type
  def image_type
    if image.attached? && !image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, 'Image should be a JPEG or a PNG!')
    elsif image.attached? == false
      errors.add(:image, 'You must have an image!')
    end
  end
end
