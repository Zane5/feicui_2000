class CreateProduct < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string 'name'
      t.text 'description'
      t.text 'short_description'
      t.boolean 'active',           default: true
      t.decimal 'cost_price',       precision: 8, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
