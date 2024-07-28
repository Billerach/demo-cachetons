class CreateContributions < ActiveRecord::Migration[7.1]
  def change
    create_table :contributions do |t|
      t.string :name
      t.string :fund
      t.float :employee_part
      t.float :employer_part
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
