class CreateCafeFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :cafe_favorites do |t|
      t.integer :customer_id
      t.integer :cafe_post_id

      t.timestamps
    end
  end
end
