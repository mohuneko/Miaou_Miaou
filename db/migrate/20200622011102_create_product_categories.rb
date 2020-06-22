class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :category
      t.boolean :is_valid

      t.timestamps
    end
  end
end
