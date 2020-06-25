class Customers::ProductPostsController < ApplicationController

 def index
  @product_post = ProductPost.new
  @product_posts = ProductPost.all.page(params[:page]).per(8) #paginate
  @product_categories = ProductCategory.where(is_valid: true)
 end

 def show
  @product_post = ProductPost.find(params[:id])
  @product_comment = ProductComment.new #コメントの投稿
  @customer = @product_post.customer
  @comments = ProductComment.where(product_post_id: @product_post.id).page(params[:page] || 1).per(5)
 end

 def favorite
  @product_posts = current_customer.favorite_products.page(params[:page]).per(8)
 end

 def create
 	@product_post = ProductPost.new(product_post_params)
 	@product_post.customer_id = current_customer.id
 	if @product_post.save
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

 def mypost
  product_posts = current_customer.product_posts
  cafe_posts = current_customer.cafe_posts
  @mixed_posts = product_posts + cafe_posts
  @mixed_posts.sort{|f,s| f.created_at <=> s.created_at}
 end


 private

 def product_post_params
  params.require(:product_post).permit(:customer_id, :product_category_id, :price_rate, :favorite_rate, :total_rate, :product_name, :price, :description, :picture, :name)
 end

end
