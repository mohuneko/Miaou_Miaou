class Customers::CafePostsController < ApplicationController

 def index
  @cafe_post = CafePost.new
  @cafe_posts = CafePost.all.page(params[:page]).per(8) #paginate
 end

 def show
  @cafe_post = CafePost.find(params[:id])
  @cafe_comment = CafeComment.new #コメントの投稿
  @customer = @cafe_post.customer
  @comments = CafeComment.where(cafe_post_id: @cafe_post.id).page(params[:page] || 1).per(5)
 end

 def favorite
  @cafe_posts = current_customer.favorite_posts.page(params[:page]).per(8)
 end

 def create
 	@cafe_post = CafePost.new(cafe_post_params)
 	@cafe_post.customer_id = current_customer.id
 	if @cafe_post.save
 		  redirect_to customers_cafe_post_path(@cafe_post.id)
 	else
 		  render :new
 		end
 end

 def new
 	@cafe_post = CafePost.new
 end

 def destroy
  cafe_post = CafePost.find(params[:id])
  cafe_post.destroy
  redirect_to customers_cafe_posts_path
 end

 def edit
 	@cafe_post = CafePost.find(params[:id])
 end

 def update
 	@cafe_post = CafePost.find(params[:id])
 	if @cafe_post.update(cafe_post_params)
 		 redirect_to customers_cafe_posts_path(@cafe_post.id)
 	else
 		 render :edit
 	end
 end

 private

 def cafe_post_params
  params.require(:cafe_post).permit(:customer_id, :cafe_category_id, :price_rate, :favorite_rate, :total_rate, :cafe_name, :price, :description, :picture, :name)
 end

end

end
