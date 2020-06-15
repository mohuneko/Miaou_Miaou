class Customers::ProductPostsController < ApplicationController

 def index
  @product_post = ProductPost.new
  @product_posts = ProductPost.all #のちにpagenate設定
 end

 def show
 	@product_post = ProductPost.find(params[:id])
 	@product_comment = ProductComment.new #コメントの投稿
 end

 def favorite
 end

 def create
 	@product_post = ProductPost.new(product_post_params)
 	@product_post.customer_id = current_customer.id
 	@product_post.category_id = 1
 	if @product_post.save!
 		  redirect_to customers_product_post_path(@product_post.id)
 	else
 		  render :new
 		end
 end

 def new
 	@product_post = ProductPost.new
 end

 def destroy
  product_post = ProductPost.find(params[:id])
  product_post.destroy
  redirect_to customers_product_posts_path
 end

 def edit
 	@product_post = ProductPost.find(params[:id])
 end

 def update
 	@product_post = ProductPost.find(params[:id])
 	if @product_post.update(product_post_params)
 		 redirect_to customers_product_posts_path(@product_post.id)
 	else
 		 render :edit
 	end
 end

 private 

 def product_post_params
  params.require(:product_post).permit(:customer_id, :category_id, :price_rate, :favorite_rate, :total_rate, :product_name, :price, :description, :picture)
 end

end
