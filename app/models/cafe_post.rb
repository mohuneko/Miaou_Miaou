class CafePost < ApplicationRecord
 belongs_to :customer
 belongs_to :cafe_category
 has_many :cafe_favorites
 has_many :cafe_comments
 # attachment :picture #画像投稿
 mount_uploader :picture, ImagesUploader
end
