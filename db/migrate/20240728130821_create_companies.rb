class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :siret
      t.string :naf
      t.string :address
      t.string :license_number
      t.string :specialty
      t.timestamps
    end
  end
end
