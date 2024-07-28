# frozen_string_literal: true

# This class represents the contributions to be applied to each payslip.
# It contains the name of the fund that collects the contribution (URSSAF, France Travail, Congés Spectacle, etc.),
# the name of the contribution, the employee share, the employer share, the start date and the end date.

class Contribution < ApplicationRecord
  has_many :job_profiles_to_contributions_links
  has_many :payslips_to_contributions_links
  has_many :job_profiles, through: :job_profiles_to_contributions_links

  validates :fund,          presence: true
  validates :name,          presence: true
  validates :employee_part, presence: true
  validates :employer_part, presence: true
  validates :start_date,    presence: true
end
