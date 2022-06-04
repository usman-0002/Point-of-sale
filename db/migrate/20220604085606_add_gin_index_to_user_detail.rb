class AddGinIndexToUserDetail < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pg_trgm'
    add_index :user_details, :first_name, opclass: :gin_trgm_ops, using: :gin, name: 'first_name_gin_index_on_user_details'
    add_index :user_details, :last_name, opclass: :gin_trgm_ops, using: :gin, name: 'last_name_gin_index_on_user_details'
  end
end
