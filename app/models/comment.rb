class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true
  
  #carrierwave用に作ったカラム名
  mount_uploader :image, ImageUploader
end
