class CreatePayslips < ActiveRecord::Migration[7.1]
  def change
    create_table :payslips do |t|
      t.integer :payslip_number
      t.date    :contract_start
      t.date    :contract_end
      t.date    :payment_date
      t.string  :payment_id
      t.string  :job_profile
      t.integer :hours_per_day
      t.integer :number_of_days
      t.boolean :executive
      t.integer :allowance
      t.float   :basis
      t.float   :basis_per_day
      t.float   :allowance_basis
      t.integer :number_of_hours
      t.float   :employer_s_contribution
      t.float   :employee_s_contribution
      t.float   :net_salary
      t.float   :taxable_net
      t.float   :urssaf_limit
      t.float   :employer_cost
      t.integer :number_of_performance, default: 0
      t.integer :number_of_rehearsal, default: 0
      t.float   :gross_salary_accumulation
      t.float   :taxable_net_accumulation
      t.float   :net_accumulation
      t.float   :urssaf_limit_accumulation
      t.float   :employer_cost_accumulation
      t.integer :hours_accumulation
      t.boolean :artist
      t.timestamps
    end
  end
end
