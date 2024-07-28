class CreateJobProfilesToContributionsLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :job_profiles_to_contributions_links do |t|
      t.references :job_profile, foreign_key: true
      t.references :contribution, foreign_key: true
      t.timestamps
    end
  end
end
