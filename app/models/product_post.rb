class ProductPost < ApplicationRecord
 belongs_to :customer
 belongs_to :product_category
 has_many :product_favorites
 has_many :product_comments
 # attachment :picture #画像投稿
 mount_uploader :picture, ImagesUploader

 validates :product_name, presence: true
 validates :price, presence: true
 validates :description, presence: true
 validates :price_rate, presence: true
 validates :favorite_rate, presence: true
 validates :total_rate, presence: true

 def favorited_by?(customer) #因数で渡されたcustomer.idがfavoritesテーブル内に存在するかどうか
 	product_favorites.where(customer_id: customer.id).exists?
 end


  def ProductPost.search(search, product_post_or_cafe_post)
       if product_post_or_cafe_post == "1"
          ProductPost.where(['product_name LIKE?', "%#{search}%"])
      else
         ProductPost.all
       end
     end
  end

