class ApplicationController < ActionController::Base
  before_action :set_categories
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tell ])
      #sign_upの際にnameのデータ操作を許。追加したカラム。
  end

  def set_categories
    @product_categories = ProductCategory.where(is_valid: true)
    @cafe_categories = CafeCategory.where(is_valid: true)
    @mixed_categories = @product_categories + @cafe_categories
  end
end
