class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships
  has_many :cafe_favorites
  has_many :cafe_posts
  has_many :cafe_comments
  has_many :product_favorites
  has_many :product_posts
  has_many :product_comments
  has_many :contact
  attachment :profile_image

end
