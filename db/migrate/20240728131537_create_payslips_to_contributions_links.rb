class CreatePayslipsToContributionsLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :payslips_to_contributions_links do |t|
      t.references :payslip, foreign_key: true
      t.references :contribution, foreign_key: true
      t.timestamps
    end
  end
end
