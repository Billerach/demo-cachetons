class AddDefaultValueToPayslips < ActiveRecord::Migration[7.1]
  def change
    change_column_default :payslips, :basis, 0
    change_column_default :payslips, :basis_per_day, 0
    change_column_default :payslips, :number_of_hours, 0
    change_column_default :payslips, :employer_s_contribution, 0
    change_column_default :payslips, :employee_s_contribution, 0
    change_column_default :payslips, :net_salary, 0
    change_column_default :payslips, :taxable_net, 0
    change_column_default :payslips, :urssaf_limit, 0
    change_column_default :payslips, :employer_cost, 0
  end
end
