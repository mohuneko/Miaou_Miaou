class CafeFavorite < ApplicationRecord
 belongs_to :customer
 belongs_to :cafe_post
end
