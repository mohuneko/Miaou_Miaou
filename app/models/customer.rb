  class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :relationships, dependent: :destroy #カスタマーがDBから削除された場合、カスタマーが◯◯したものが全て消える
  has_many :cafe_favorites, dependent: :destroy
  has_many :cafe_posts, dependent: :destroy
  has_many :cafe_comments, dependent: :destroy
  has_many :product_favorites, dependent: :destroy
  has_many :favorite_posts, through: :product_favorites, source: :product_post  # 孫要素の取得
  has_many :product_posts, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :contact

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得

  has_many :following_customer, through: :follower, source: :followed #自分がフォローしている人
  has_many :follower_customer, through: :followed, source: :follower #自分をフォローしている人

  # attachment :profile_image
  mount_uploader :profile_image, ImagesUploader


#フォローする
 def follow(customer_id)
   follower.create(followed_id: customer_id)
 end

 #フォローを外す
 def unfollow(customer_id)
   follower.find_by(followed_id: customer_id).destroy
 end

 # フォローしていればtrueを返す
 def following?(customer)
  following_customer.include?(customer)
 end

end
