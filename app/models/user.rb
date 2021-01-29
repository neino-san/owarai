class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :email, presence: true
  validates :profile, length: { maximum: 200 }
  mount_uploader :image, ImageUploader
  
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
 
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
 
  def following?(other_user)
    following.include?(other_user)
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end