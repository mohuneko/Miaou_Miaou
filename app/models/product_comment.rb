class ProductComment < ApplicationRecord
 belongs_to :customer
 belongs_to :product_post

 validates :comment, presence: true

 #一つの投稿に対して一人一つまでの投稿ができるメソッド
 def comment_already_posted?
  ProductComment.find_by(customer_id: self.customer_id, product_post_id: self.product_post_id).present?
 end
end
