class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true
  mount_uploader :image, ImageUploader
end
