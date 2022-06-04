class AddGinIndexToProduct < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pg_trgm'
    add_index :products, :name, opclass: :gin_trgm_ops, using: :gin, name: 'name_gin_index_on_products'
    add_index :products, :code, opclass: :gin_trgm_ops, using: :gin, name: 'code_gin_index_on_products'
  end
end
