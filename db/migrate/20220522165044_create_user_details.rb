class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :first_name,       default: '',     null: false
      t.string :last_name,        default: '',     null: false
      t.string :email,            default: ''
      t.string :mobile_number,    default: ''
      t.string :address,          default: ''
      t.string :city,             default: ''
      t.references :detailable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
