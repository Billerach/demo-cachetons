class CreateJobProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :job_profiles do |t|
      t.string :name
      t.boolean :executive, default: false, null: false
      t.boolean :artist, default: false, null: false
      t.timestamps
    end
  end
end
