# frozen_string_literal: true

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

p1 = Performance.create!(company_id: company1.id, name: 'To be', num_objet: '123Z68686634')
p2 = Performance.create!(company_id: company2.id, name: 'La Déglingue', num_objet: '321Z68686635')
p3 = Performance.create!(company_id: company1.id, name: 'Jeux de Pouvoirs', num_objet: '456Z68686661')
Performance.create!(company_id: company1.id, name: 'Les Désossés', num_objet: '286Z68686628')
Performance.create!(company_id: company1.id, name: 'Le silence des enfers', num_objet: '789Z68686613')
Performance.create!(company_id: company1.id, name: 'Pli Pla Plou', num_objet: '147Z68686605')
Performance.create!(company_id: company1.id, name: 'Cuillère', num_objet: '285Z68686601')
Performance.create!(company_id: company2.id, name: 'Nulle Part', num_objet: '369Z68686689')
Performance.create!(company_id: company2.id, name: "J'aurais voulu ne pas naître un artiste", num_objet: '654Z68686477')
Performance.create!(company_id: company2.id, name: 'Affections Angulaires', num_objet: '987Z68686111')

puts 'Performances created'


puts 'Creating employees'

load Rails.root.join('db', 'seed_data', 'employees_data.rb')
@employees[0..4].each { |e| e[:company_id] = company1.id}
@employees[5..7].each { |e| e[:company_id] = company2.id}

employees = []
@employees.each { |e| employees << Employee.create!(e) }

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

payslip1 = Payslip.create!(company: company1, employee: employees[0], performance: p3)
payslip1.update!(@payslip1)

payslip2 = Payslip.create!(company: company2, employee: employees[7], performance: p2)
payslip2.update!(@payslip2)

12.times do |i|
  p = Payslip.create!(company: company1, employee: employees[0], performance: p3)
  p.update!(payslip_number: i+2)
  if i < 8
    p.update!(
      contract_start: "2024-0#{i+1}-01",
      contract_end: "2024-0#{i+1}-01",
      payment_date: "2024-0#{i+1}-01"
      )
  else
    p.update!(
      contract_start: "2024-#{i+1}-01",
      contract_end: "2024-#{i+1}-01",
      payment_date: "2024-#{i+1}-01"
      )
  end
  p.update!(@payslips_jean)
end

puts 'Payslips created'


puts 'Creatings payslips to contributions links'

Payslip.all.each do |payslip|
  common_contributions.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
  non_artists_common_contributions.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
  specific_nartistnc_contributions.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
end

puts 'Payslips to contributions links created'
