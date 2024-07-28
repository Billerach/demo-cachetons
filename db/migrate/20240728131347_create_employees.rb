class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :phone
      t.string :phone_2
      t.string :NIR
      t.string :conges_spectacles
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :departement_of_birth
      t.string :country_of_birth
      t.timestamps
    end
  end
end
