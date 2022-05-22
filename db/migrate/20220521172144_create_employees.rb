class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :job_title, default: ''
      t.date :joined_at

      t.timestamps
    end
  end
end
