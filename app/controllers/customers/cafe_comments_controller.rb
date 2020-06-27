class Customers::CafeCommentsController < ApplicationController

  before_action :authenticate_customer! #ログインしているユーザーのみ入れる

 def create
  @cafe_post = CafePost.find(params[:cafe_post_id])
  @cafe_comment = current_customer.cafe_comments.new(cafe_comment_params)
  @cafe_comment.cafe_post_id = @cafe_post.id
  if !@cafe_comment.comment_already_posted? && @cafe_comment.save
  	flash[:notice] = "success!"
  	redirect_to request.referer #成功
  else
    @customer = @cafe_post.customer
    @comments = CafeComment.where(cafe_post_id: @cafe_post.id).page(1).per(5)
  	render 'customers/cafe_posts/show' #失敗
  end
 end

 def destroy
  comment = CafeComment.find(params[:id])
  comment.destroy
  redirect_back(fallback_location: root_path)
 end

 private
 def cafe_comment_params
 	params.require(:cafe_comment).permit(:comment, :customer_id, :cafe_post_id, :total_rate)
 end
end

