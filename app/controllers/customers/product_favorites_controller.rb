class Customers::ProductFavoritesController < ApplicationController

  before_action :authenticate_customer! #ログインしエチルユーザーのみ

 def create
  @product_post = ProductPost.find(params[:product_post_id])
  favorite = current_customer.product_favorites.new(product_post_id: @product_post.id)
  favorite.save
  redirect_to customers_product_post_path(@product_post)
 end

 def destroy
  @product_post = ProductPost.find(params[:product_post_id])
  favorite = current_customer.product_favorites.find_by(product_post_id: @product_post.id)
  favorite.destroy
  redirect_to customers_product_post_path(@product_post)
 end

end
