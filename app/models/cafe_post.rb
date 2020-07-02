class CafePost < ApplicationRecord
 belongs_to :customer
 belongs_to :cafe_category
 has_many :cafe_favorites
 has_many :cafe_comments
 # attachment :picture #画像投稿
 mount_uploader :picture, ImagesUploader

validates :shop_name, presence: true
validates :price, presence: true
validates :description, presence: true
validates :price_rate, presence: true
validates :free_rate, presence: true
validates :total_rate, presence: true

 def favorited_by?(customer) #因数で渡されたcustomer.idがfavoritesテーブル内に存在するかどうか
 	cafe_favorites.where(customer_id: customer.id).exists?
 end

 def CafePost.search(search, product_post_or_cafe_post)
  if product_post_or_cafe_post == "2"
     CafePost.where(['shop_name LIKE?', "%#{search}%"])
  else
     CafePost.all
   end
 end
end
