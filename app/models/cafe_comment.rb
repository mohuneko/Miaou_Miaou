class CafeComment < ApplicationRecord
 belongs_to :customer
 belongs_to :cafe_post

validates :comment, presence: true

 #一つの投稿に対して一人一つまでの投稿ができるメソッド
 def comment_already_posted?
  CafeComment.find_by(customer_id: self.customer_id, cafe_post_id: self.cafe_post_id).present?
 end
end
