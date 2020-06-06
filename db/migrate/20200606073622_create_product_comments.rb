class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.integer :customer_id
      t.integer :product_post_id
      t.float :total_rate
      t.text :comment

      t.timestamps
    end
  end
end
