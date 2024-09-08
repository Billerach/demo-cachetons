# frozen_string_literal: true
require "open-uri"

puts 'Destroy payslips to contributions links'
PayslipsToContributionsLink.destroy_all

puts 'Destroy payslips'
Payslip.destroy_all

puts 'Destroy job profiles to contributions links'
JobProfilesToContributionsLink.destroy_all

puts 'Destroy employees'
Employee.destroy_all

puts 'Destroy contributions'
Contribution.destroy_all

puts 'Destroy performances'
Performance.destroy_all


puts 'Destroy companies'
Company.destroy_all

puts 'Destroy job_profiles'
JobProfile.destroy_all

puts 'Creatings companies'

company1 = Company.create!(
  name: 'Les cantonniers de Corcové',
  siret: '123 568 941 00056',
  naf: '90.01Z',
  address: '3 rue du gnou, 44156 Pâté-sur-mer',
  license_number: '1076958',
  specialty: 'troupe de théâtre'
)
company2 = Company.create!(
  name: 'Pumped Up',
  siret: '124 456 789 00025',
  naf: '90.01Z',
  address: '47 boulevard de la seed, 13568 Lingottière',
  license_number: '1076598',
  specialty: 'groupe de musique'
)

puts 'Companies created'


puts 'Creatings performances'

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837624/Ruan_Jia_Nocturne_obhxkc.jpg").open
p1 = Performance.create!(company_id: company1.id, name: 'To be', num_objet: '123Z68686634')
p1.picture.attach(io: file, filename: "performance1.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837601/Final_Fantasy_modif_AQL_ydacxl.jpg").open
p2 = Performance.create!(company_id: company2.id, name: 'La Déglingue', num_objet: '321Z68686635')
p2.picture.attach(io: file, filename: "performance2.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837600/Exordium_mciyso.jpg").open

p3 = Performance.create!(company_id: company1.id, name: 'Jeux de Pouvoirs', num_objet: '456Z68686661')
p3.picture.attach(io: file, filename: "performance3.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837600/Eve_WP29_1600_r9bcqa.jpg").open
p4 = Performance.create!(company_id: company1.id, name: 'Les Désossés', num_objet: '286Z68686628')
p4.picture.attach(io: file, filename: "performance4.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837599/Eve_WP28_1600_trlm4x.jpg").open
p5 = Performance.create!(company_id: company1.id, name: 'Le silence des enfers', num_objet: '789Z68686613')
p5.picture.attach(io: file, filename: "performance5.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837599/Eve_WP27_1600_lx57s2.jpg").open
p6 = Performance.create!(company_id: company1.id, name: 'Pli Pla Plou', num_objet: '147Z68686605')
p6.picture.attach(io: file, filename: "performance6.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837599/Eve_WP26_1600_u6osd8.jpg").open
p7 = Performance.create!(company_id: company1.id, name: 'Cuillère', num_objet: '285Z68686601')
p7.picture.attach(io: file, filename: "performance7.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837580/c-bebop2_ffzcdd.jpg").open
p8 = Performance.create!(company_id: company2.id, name: 'Nulle Part', num_objet: '369Z68686689')
p8.picture.attach(io: file, filename: "performance8.jpg", content_type: "image/jpg")

file = URI.parse("https://res.cloudinary.com/daqtghh5t/image/upload/v1725837598/Eve_Online_aqp4t5.jpg").open
p9 = Performance.create!(company_id: company2.id, name: 'Affections Angulaires', num_objet: '987Z68686111')
p9.picture.attach(io: file, filename: "performance9.jpg", content_type: "image/jpg")

puts 'Performances created'


puts 'Creating employees'

load Rails.root.join('db', 'seed_data', 'employees_data.rb')

@employees[0..4].each { |e| e[:company_id] = company1.id}
@employees[5..7].each { |e| e[:company_id] = company2.id}

employees = []
@employees.each { |e| employees << Employee.create!(e) }

20.times do
  Employee.create!(
    firstname: 'TEST',
    lastname: 'TEST',
    company_id: company2.id,
    address: "TEST",
    phone: 'TEST',
    NIR: 'TEST',
    conges_spectacles: 'TEST',
    date_of_birth: Date.new(1951, 11, 2),
    place_of_birth: 'TEST',
    departement_of_birth: 'TEST',
    country_of_birth: 'TEST'
  )
end

puts 'Employees created'


puts 'Creating contributions'

load Rails.root.join('db', 'seed_data', 'contributions_data.rb')
common_contributions = []
artists_common_contributions = []
non_artists_common_contributions = []
specific_nartistnc_contributions = []
specific_nartistc_contributions = []
specific_artistnc_contributions = []
specific_artistc_contributions = []

@common_contributions_array.each { |c| common_contributions << Contribution.create!(c) }
@artists_contributions_array.each { |c| artists_common_contributions << Contribution.create!(c) }
@non_artists_contributions_array.each { |c| non_artists_common_contributions << Contribution.create!(c) }
@n_artists_nc_contributions_array.each { |c| specific_nartistnc_contributions << Contribution.create!(c) }
@n_artists_c_contributions_array.each { |c| specific_nartistc_contributions << Contribution.create!(c) }
@artists_nc_contributions_array.each { |c| specific_artistnc_contributions << Contribution.create!(c) }
@artists_c_contributions_array.each { |c| specific_artistc_contributions << Contribution.create!(c) }

puts 'Contributions created'


puts 'Creating job profiles and their links to contributions'

load Rails.root.join('db', 'seed_data', 'jobs_lists.rb')

@nartistsnc.each do |job|
  job_profile = JobProfile.create!(artist: false, executive: false, name: job)
  non_artist_non_executive_contributions =
    common_contributions + non_artists_common_contributions + specific_nartistnc_contributions
  non_artist_non_executive_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

@nartistsc.each do |job|
  job_profile = JobProfile.create!(artist: false, executive: true, name: job)
  non_artist_executive_contributions =
    common_contributions + non_artists_common_contributions + specific_nartistc_contributions
  non_artist_executive_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

@artistsnc.each do |job|
  job_profile = JobProfile.create!(artist: true, executive: false, name: job)
  artist_non_executive_contributions =
    common_contributions + artists_common_contributions + specific_artistnc_contributions
  artist_non_executive_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

@artistsc.each do |job|
  job_profile = JobProfile.create!(artist: true, executive: true, name: job)
  artist_executive_contributions =
    common_contributions + artists_common_contributions + specific_artistnc_contributions
    artist_executive_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

puts 'Job profiles created'


puts 'Creating payslips'

load Rails.root.join('db', 'seed_data', 'payslips_data.rb')

payslips1to14 = []
12.times do |i|
  payslip = Payslip.create!(company: company1, employee: employees[0], performance: p3)
  payslip.update!(payslip_number: i+2)
  if i < 8
    payslip.update!(
      contract_start: "2024-0#{i+1}-01",
      contract_end: "2024-0#{i+1}-01",
      payment_date: "2024-0#{i+1}-01"
    )
  else
    payslip.update!(
      contract_start: "2024-#{i+1}-01",
      contract_end: "2024-#{i+1}-01",
      payment_date: "2024-#{i+1}-01"
    )
  end
  payslip.update!(@payslips_producer)
  payslips1to14 << payslip
end

payslip13 = Payslip.create!(company: company1, employee: employees[0], performance: p3)
payslip13.update!(@producer_payslip_september_festival)
payslips1to14 << payslip13

payslip14 = Payslip.create!(company: company2, employee: employees[7], performance: p2)
payslip14.update!(@producer_payslip_october_tour)
payslips1to14 << payslip14

payslip15 = Payslip.create!(company: company1, employee: employees[1], performance: p3)
payslip15.update!(@comedians_payslip_september_festival)

payslip16 = Payslip.create!(company: company1, employee: employees[4], performance: p3)
payslip16.update!(@comedians_payslip_september_festival)

payslip17 = Payslip.create!(company: company2, employee: employees[5], performance: p2)
payslip17.update!(@musician_payslip_october_tour)

payslip18 = Payslip.create!(company: company2, employee: employees[6], performance: p2)
payslip18.update!(@singer_payslip_october_tour)

payslip19 = Payslip.create!(company: company1, employee: employees[3], performance: p3)
payslip19.update!(@sound_manager_payslip_september_festival)

payslip20 = Payslip.create!(company: company1, employee: employees[2], performance: p3)
payslip20.update!(@director_payslip_september_festival)

puts 'Payslips created'


puts 'Creatings payslips to contributions links'

# Everybody's contributions are here linked to everybody's payslips
Payslip.all.each do |payslip|
  common_contributions.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
end

# adding links for non-artist, non-executive employee
payslips1to14.each do |payslip|
  non_artists_common_contributions.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
  specific_nartistnc_contributions.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
end

# adding links for non-artist, executive employee
non_artists_common_contributions.each do |contribution|
  PayslipsToContributionsLink.create!(payslip: payslip19, contribution:)
end
specific_nartistc_contributions.each do |contribution|
  PayslipsToContributionsLink.create!(payslip: payslip19, contribution:)
end

# adding links for artist, non-executive employee
artists_common_contributions.each do |contribution|
  PayslipsToContributionsLink.create!(payslip: payslip15, contribution:)
  PayslipsToContributionsLink.create!(payslip: payslip16, contribution:)
  PayslipsToContributionsLink.create!(payslip: payslip17, contribution:)
  PayslipsToContributionsLink.create!(payslip: payslip18, contribution:)
end
specific_artistnc_contributions.each do |contribution|
  PayslipsToContributionsLink.create!(payslip: payslip15, contribution:)
  PayslipsToContributionsLink.create!(payslip: payslip16, contribution:)
  PayslipsToContributionsLink.create!(payslip: payslip17, contribution:)
  PayslipsToContributionsLink.create!(payslip: payslip18, contribution:)
end

# adding links for artist, non-executive employee
artists_common_contributions.each do |contribution|
  PayslipsToContributionsLink.create!(payslip: payslip20, contribution:)
end
specific_artistc_contributions.each do |contribution|
  PayslipsToContributionsLink.create!(payslip: payslip20, contribution:)
end

puts 'Payslips to contributions links created'
