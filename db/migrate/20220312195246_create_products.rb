class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false, default: ''
      t.text :description, default: ''
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
