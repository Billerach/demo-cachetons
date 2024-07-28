# frozen_string_literal: true

# This class represents the employees. They are linked to their payslips by the foreign key in it,
# same thing for the company. It contains their names, address, phone, NIR (french social security number),
# "congés spectacle" number (the employee's identification code for the fund responsible for financing paid
# leave for entertainment workers), and finally the date, place, French departement or country_of_birth

class Employee < ApplicationRecord
  has_many :payslips
  belongs_to :company

  validates :firstname,         presence: true
  validates :lastname,          presence: true
  validates :address,           presence: true
  validates :phone,             presence: true
  validates :NIR,               presence: true
  validates :date_of_birth,     presence: true
  validates :place_of_birth,    presence: true
  validates :country_of_birth,  presence: true
  validates :company,           presence: true

  def lastname_with_firstname
    "#{firstname} #{lastname}"
  end
end
