class CustomersController < ApplicationController

 def mypage
  @customer = current_customer
 end

 def edit
  @customer = current_customer
 end

 def withdraw
  @customer = current_customer
 end

 def fix
  @customer = current_customer
 end

 def fix_update
 	@customer = current_customer
 	if @customer.update(customer_params)
 		redirect_to customers_mypage_path
 	else
 		render "fix"
 	end
 end

 def withdraw_update
 	@customer = current_customer
 	@customer.update(status: false)
 	#ログアウトする
 	reset_session
 	redirect_to root_path
 end

 private
 def customer_params
 	params.require(:customer).permit(:name, :tell, :profile_image, :email)
 end
end
