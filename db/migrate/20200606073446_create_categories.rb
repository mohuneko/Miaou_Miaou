class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category
      t.boolean :is_valid

      t.timestamps
    end
  end
end
