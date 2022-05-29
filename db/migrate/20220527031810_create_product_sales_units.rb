class CreateProductSalesUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sales_units do |t|
      t.integer :order_availability, default: 0, null: false
      t.integer :quantity, default: 0,     null: false
      t.money :unit_price, default: 0,     null: false
      t.references :product, foreign_key: true, index: true, null: false
      t.references :sales_unit, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
