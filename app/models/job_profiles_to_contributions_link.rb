# frozen_string_literal: true

# This class represents the association between a job profile and a contribution
# It contains the job_profile_id and the contribution_id
# it's scalable over time, and if a contribution rate change occurs in the future,
# a new contribution is created and the payslip template must be modified accordingly
# (or a new one can be created - at the user's discretion).
class JobProfilesToContributionsLink < ApplicationRecord
  belongs_to :job_profile
  belongs_to :contribution
end
