class CreateSalesUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_units do |t|
      t.string :name, default: '', null: false
      t.string :abbreviation, default: '', null: false

      t.timestamps
    end
  end
end
