class Customers::ProductCategoriesController < ApplicationController

 def index
  id = params[:id] ? params[:id] : 1

  set_product(id) if params[:type] == ProductCategory.name
  set_cafe(id) if params[:type] == CafeCategory.name
  if params[:type].nil?
  	set_product(id)
    set_cafe(id)
    @mixed_posts = @product_posts + @cafe_posts
  end

  @mixed_posts.sort{|f,s| f.created_at <=> s.created_at}
 end

private

  def set_product(id)
    @product_category = ProductCategory.find(id)
    @mixed_category = @product_category
    @mixed_posts = ProductPost.where(product_category_id: id)
  end

  def set_cafe(id)
    @cafe_category = CafeCategory.find(id)
    @mixed_category = @cafe_category
    @mixed_posts = CafePost.where(cafe_category_id: id)
  end

end
