# frozen_string_literal: true

# This class represents the company issuing the pay slips.
# It also contains administrative data such as name, SIRET, NAF code, address, entertainment license number, etc.
# A specialty column has been added to allow the user a customisation of a company
# (is it a band ? a theater company ? etc.)
#

class Company < ApplicationRecord
  has_many :payslips
  has_many :employees
  has_many :performances

  has_many :company_links

  validates :name, presence: true, uniqueness: true
end
