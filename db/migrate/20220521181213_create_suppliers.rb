class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :company_name, default: ''
      t.string :office_number, default: ''

      t.timestamps
    end
  end
end
