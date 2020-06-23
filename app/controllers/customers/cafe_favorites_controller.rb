class Customers::CafeFavoritesController < ApplicationController

  def create
  @cafe_post = CafePost.find(params[:cafe_post_id])
  favorite = current_customer.cafe_favorites.new(cafe_post_id: @cafe_post.id)
  favorite.save
  redirect_to customers_cafe_post_path(@cafe_post)
 end

 def destroy
  @cafe_post = CafePost.find(params[:cafe_post_id])
  favorite = current_customer.cafe_favorites.find_by(cafe_post_id: @cafe_post.id)
  favorite.destroy
  redirect_to customers_cafe_post_path(@cafe_post)
 end

end

