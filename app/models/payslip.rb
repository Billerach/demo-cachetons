# frozen_string_literal: true

# This class represents pay slips.
# It contains all the information specific to payslips, and is linked to contributions by a join table other
# than the one used by job_profiles: payslips_to_contributions_links.
class Payslip < ApplicationRecord
  has_many :payslips_to_contributions_links, dependent: :destroy
  has_many :contributions, through: :payslips_to_contributions_links
  belongs_to :employee
  belongs_to :performance
  belongs_to :company

  # TODO: validations

  def is_last_payslip?
    Payslip.where(employee: self.employee.id).count == self.payslip_number
  end
end
