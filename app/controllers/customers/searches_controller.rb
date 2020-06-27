class Customers::SearchesController < ApplicationController

　before_action :authenticate_customer! #ログインしエチルユーザーのみ

  def search
  method = params[:search_method]
  word = params[:search]
  @product_post = ProductPost.search(method, word)
  @cafe_post = CafePost.search(method, word)
 end
end
