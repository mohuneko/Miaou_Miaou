# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected


   def reject_user
     @user = Customer.find_by(email: params[:customer][:email].downcase)
     if @user
       if @user.status == false
         flash[:error] = "退会済みです。"
         redirect_to new_customer_session_path
       end
     else
       flash[:error] = "必須項目を入力してください。"
     end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
