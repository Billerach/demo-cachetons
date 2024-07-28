class CreatePerformances < ActiveRecord::Migration[7.1]
  def change
    create_table :performances do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.string :num_objet
      t.timestamps
    end
  end
end
