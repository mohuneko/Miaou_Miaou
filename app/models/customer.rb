  class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, dependent: :destroy #カスタマーがDBから削除された場合、カスタマーが◯◯したものが全て消える
  has_many :cafe_favorites, dependent: :destroy
  has_many :cafe_posts, dependent: :destroy
  has_many :cafe_comments, dependent: :destroy
  has_many :product_favorites, dependent: :destroy
  has_many :product_posts, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :contact
  # attachment :profile_image
  mount_uploader :profile_image, ImagesUploader

end
