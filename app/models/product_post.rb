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

 def favorited_by?(customer) #因数で渡されたcustomer.idがfavoritesテーブル内に存在するかどうか
 	product_favorites.where(customer_id: customer.id).exists?
 end

end
