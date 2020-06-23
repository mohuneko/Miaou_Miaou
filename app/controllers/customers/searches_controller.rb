class Customers::SearchesController < ApplicationController

  def search
  method = params[:search_method]
  word = params[:search]
  @product_post = ProductPost.search(method, word)
  @cafe_post = CafePost.search(method, word)
 end
end
