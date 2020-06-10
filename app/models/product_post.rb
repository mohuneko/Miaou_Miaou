class ProductPost < ApplicationRecord
 belongs_to :customer
 belongs_to :category
 has_many :product_favorites
 has_many :product_comments
 attachment :picture #画像投稿
end
