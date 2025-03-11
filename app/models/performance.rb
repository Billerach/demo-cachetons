# frozen_string_literal: true

# This class represents a performance created in a company.
# It contains its name, its 'numéro d'objet' (vaguely translatable into a subject number which is the show's
# identifier with France Travail, the French employment agency) and the company_id.
# Each payslip contains a reference to its performance.
class Performance < ApplicationRecord
  belongs_to :company
  has_many :payslips, dependent: :destroy
  has_one_attached :picture
  has_one_attached :picture

  validates :name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
