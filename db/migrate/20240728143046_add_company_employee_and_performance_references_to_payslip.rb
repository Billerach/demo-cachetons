class AddCompanyEmployeeAndPerformanceReferencesToPayslip < ActiveRecord::Migration[7.1]
  def change
      add_reference :payslips, :company, foreign_key: true
      add_reference :payslips, :employee, foreign_key: true
      add_reference :payslips, :performance, foreign_key: true
  end
end
