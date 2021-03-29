class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#　名前は0字以上35字以下
  validates :name, presence: true, length: { maximum: 35 } 

#　メールは空白なし
  validates :email, presence: true 

#　プロフィールは200文字以下
  validates :profile, length: { maximum: 200 } 

#　carrierwave用に作ったカラム名
  mount_uploader :image, ImageUploader 
  
  # フォロー取得
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  # フォロワー取得
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy

# 自分がフォローしている人
  has_many :following, through: :active_relationships, source: :followed, dependent: :destroy 
  
  # 自分をフォローしている人
  has_many :followers, through: :passive_relationships, source: :follower, dependent: :destroy 

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # ユーザーをフォローする
  def follow(other_user) 
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーのフォローを外す
  def unfollow(other_user) 
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  

  def following?(other_user) # フォローしていればtrueを返す
    following.include?(other_user)
  end

  #ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
