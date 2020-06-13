class Customers::CustomersController < ApplicationController

 def mypage
 end


 private
 def customer_params
 	params.require(:customer).permit(:name, :password, :tell, :profile_image_id, :status)
 end
end
