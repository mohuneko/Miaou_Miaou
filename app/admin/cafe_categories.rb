ActiveAdmin.register CafeCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :category, :is_valid
  #
  # or
  #
  # permit_params do
  #   permitted = [:category, :is_valid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :category
    column :is_valid

    actions
  end

  permit_params :category, :is_valid
end
