class Customers::ProductCommentsController < ApplicationController
 before_action :authenticate_customer! #ログインしエチルユーザーのみ
 
 def create
  @product_post = ProductPost.find(params[:product_post_id])
  @product_comment = current_customer.product_comments.new(product_comment_params)
  @product_comment.product_post_id = @product_post.id
  if @product_comment.save
  	flash[:notice] = "success!"
  	redirect_to request.referer #成功
  else
  	render 'customers/product_posts/show' #失敗
  end
 end

 def destroy
  comment = ProductComment.find(params[:id])
  comment.destroy
  redirect_back(fallback_location: root_path)
 end

 private
 def product_comment_params
 	params.require(:product_comment).permit(:comment, :customer_id, :product_post_id, :total_rate)
 end
end
