ActiveAdmin.register ProductPost do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :category_id, :price_rate, :favorite_rate, :total_rate, :product_name, :price, :description, :picture_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :category_id, :price_rate, :favorite_rate, :total_rate, :product_name, :price, :description, :picture_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :product_name
    column :category
    column :is_valid
    actions
  end

  form do |f|
    f.inputs do
      f.input :customer_id
      f.input :picture_id, as: :file, input_html: { accept: 'image/*' }
      f.input :category_id, as: :select, collection: Category.all, :member_label => :category
      # f.input :category_id, as: :select, collection: Category.all.map { |m| [m.id.to_s + ' - ' + m.category, m.id] }
      f.input :product_name
      f.input :price
      f.input :price_rate
      f.input :favorite_rate
      f.input :total_rate
      f.input :description
    end
    f.actions
  end


  permit_params :customer_id, :category_id, :price_rate, :favorite_rate, :total_rate, :product_name, :price, :description, :picture_id, :category, :is_valid
  
end
