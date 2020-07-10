class Customers::ContactsController < ApplicationController

  before_action :authenticate_customer! #ログインしているユーザーのみ入れる

 def contact #入力画面を表示
 @contact = Contact.new
 end

 def confirm #入力値のチェック
 @contact = current_customer.contact.build(contact_params)

 if @contact.valid?
 	#OK-確認画面を表示
 	render :action => "confirm"
 else
 	#NG-入力画面を再表示
 	render :action => "contact"
 end
end

 def thanks #送信完了ページ
 @contact = Contact.new(contact_params)
 @contact.customer_id = current_customer.id
 if params[:back]
 	render :action => "contact"
 else
 	@contact.save!
 	render :action => "thanks"
 end
end

 private
 def contact_params
 	params.require(:contact).permit(:contact_name, :contact_email, :contact_content)
 end
end

