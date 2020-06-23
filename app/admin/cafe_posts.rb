ActiveAdmin.register CafePost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :category_id, :price_rate, :free_rate, :total_rate, :shop_name, :price, :description, :picture_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :category_id, :price_rate, :free_rate, :total_rate, :shop_name, :price, :description, :picture_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   index do
    column :id
    column :shop_name
    column :cafe_category
    column :is_valid
    actions
  end

  form do |f|
    f.inputs do
      f.input :customer_id
      f.input :picture, :as => :file
      f.input :cafe_category_id, as: :select, collection: CafeCategory.all, :member_label => :category
      # f.input :category_id, as: :select, collection: Category.all.map { |m| [m.id.to_s + ' - ' + m.category, m.id] }
      f.input :shop_name
      f.input :price
      f.input :price_rate
      f.input :free_rate
      f.input :total_rate
      f.input :description
    end
    f.actions
  end

  show do |item_image|
    attributes_table do
      row :customer_id
      row :picture do
        image_tag(cafe_post.picture.url)
      end
      row :cafe_category_id
      row :shop_name
      row :price
      row :price_rate
      row :free_rate
      row :total_rate
      row :description
    end
  end

  permit_params :customer_id, :cafe_category_id, :price_rate, :free_rate, :total_rate, :shop_name, :price, :description, :picture, :category, :is_valid
end

