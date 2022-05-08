class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false, default: ''
      t.text :description, default: ''
      t.integer :quantity, default: 0
      t.bigint 'category_id'

      t.timestamps
      t.index ['category_id'], name: 'index_products_on_category_id'
    end
  end
end
