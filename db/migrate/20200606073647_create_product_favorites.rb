class CreateProductFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :product_favorites do |t|
      t.integer :customer_id
      t.integer :product_post_id

      t.timestamps
    end
  end
end
