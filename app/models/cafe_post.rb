class CafePost < ApplicationRecord
 belongs_to :customer
 belongs_to :category
 has_many :cafe_favorites
 has_many :cafe_comments
 attachment :picture #画像投稿
end
