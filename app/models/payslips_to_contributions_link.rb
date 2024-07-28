# frozen_string_literal: true

# This class represents the association between a payslip and its contributions
# It contains the payslip_id and the contribution_id
# It is NOT scalable over time, unlike 'job_profiles_to_contributions_links',
# and if a contribution rate change occurs in the future, the payslip is not impacted,
# a new contribution is created, the payslip template is modified accordingly,
# but the payslip itself remains associated with the now obsolete contribution with which it was created.
class PayslipsToContributionsLink < ApplicationRecord
  belongs_to :payslip
  belongs_to :contribution
end
