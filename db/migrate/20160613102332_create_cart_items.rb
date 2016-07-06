class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :product_id, :user_id
      t.integer :position
      t.timestamps
    end
  end
end
