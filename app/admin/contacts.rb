ActiveAdmin.register Contact do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :contact_name, :contact_email, :contact_content
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :contact_name, :contact_email, :contact_content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  #一覧ページ
  index do
    column :id
    column :customer_id
    column :contact_name
    column :contact_email
    column :contact_content

    actions
  end

  permit_params :customer_id, :contact_name, :contact_email, :contact_content
end
