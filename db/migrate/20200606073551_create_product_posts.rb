class CreateProductPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_posts do |t|
      t.integer :customer_id
      t.integer :product_category_id
      t.float :price_rate
      t.float :favorite_rate
      t.float :total_rate
      t.string :product_name
      t.integer :price
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
