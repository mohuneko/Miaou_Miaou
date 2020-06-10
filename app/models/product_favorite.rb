class ProductFavorite < ApplicationRecord
 belongs_to :customer
 belongs_to :product_post
end
