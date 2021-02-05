class Post < ActiveRecord::Base
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  
  mount_uploader :image, ImageUploader
end