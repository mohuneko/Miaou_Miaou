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
    column :product_category
    column :is_valid
    actions
  end

  form do |f|
    f.inputs do
      f.input :customer_id
      f.input :picture, :as => :file
      f.input :product_category, as: :select, collection: ProductCategory.all, :member_label => :category
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

  show do |item_image|
    attributes_table do
      row :customer_id
      row :picture do
        image_tag(product_post.picture.url)
      end
      row :product_category_id
      row :product_name
      row :price
      row :price_rate
      row :favorite_rate
      row :total_rate
      row :description
    end
  end

  permit_params :customer_id, :product_category_id, :price_rate, :favorite_rate, :total_rate, :product_name, :price, :description, :picture, :category, :is_valid
  
end
