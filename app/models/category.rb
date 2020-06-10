class Category < ApplicationRecord
 has_many :cafe_posts
 has_many :product_posts

end
