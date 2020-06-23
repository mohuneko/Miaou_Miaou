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

 def favorited_by?(customer) #因数で渡されたcustomer.idがfavoritesテーブル内に存在するかどうか
 	cafe_favorites.where(customer_id: customer.id).exists?
 end

 def self.search(method,word)
	 	   if method == "forward_match"
	 	      @cafe_posts = CafePost.where("shop_name LIKE?","#{word}%")
	 	   elsif method == "backward_match"
              @cafe_posts = CafePost.where("shop_name LIKE?","%#{word}")
           elsif method == "perfect_match"
           	  @cafe_posts = CafePost.where(shop_name: "#{word}")
           elsif method == "partial_match"
           	  @cafe_posts = CafePost.where("shop_name LIKE?","%#{word}%")
           else
           	  @cafe_posts = CafePost.all
           end
   end

end
