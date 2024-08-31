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
company3 = Company.create!(
  name: 'Les illusionnés du bocal',
  siret: '125 741 258 00963',
  naf: '90.01Z',
  address: 'ZI La bellevie, 92125 Industrielle-sur-Oise',
  license_number: '1078552',
  specialty: 'companie de danse'
)

puts 'Companies created'

puts 'Creatings performances'

p1 = Performance.create!(company_id: company1.id, name: 'To be', num_objet: '123Z68686634')
p2 = Performance.create!(company_id: company2.id, name: 'La Déglingue', num_objet: '321Z68686635')
p3 = Performance.create!(company_id: company3.id, name: 'Oui mais non', num_objet: '741Z68686147')

Performance.create!(company_id: company1.id, name: 'Jeux de Pouvoirs', num_objet: '456Z68686661')
Performance.create!(company_id: company1.id, name: 'Les Désossés', num_objet: '286Z68686628')
Performance.create!(company_id: company1.id, name: 'Le silence des enfer', num_objet: '789Z68686613')
Performance.create!(company_id: company1.id, name: 'Pli Pla Plou', num_objet: '147Z68686605')
Performance.create!(company_id: company1.id, name: 'Cuillère', num_objet: '285Z68686601')
Performance.create!(company_id: company2.id, name: 'Nulle Part', num_objet: '369Z68686689')
Performance.create!(company_id: company2.id, name: "J'aurais voulu ne pas naître un artiste", num_objet: '654Z68686477')
Performance.create!(company_id: company2.id, name: 'Affections Angulaires', num_objet: '987Z68686111')
Performance.create!(company_id: company3.id, name: "Sans dec'", num_objet: '159Z68686789')
Performance.create!(company_id: company3.id, name: 'Le Grand Barzingue', num_objet: '296Z68686456')

puts 'Performances created'

puts 'Creating employees'

jean = Employee.create!(
  firstname: 'Jean',
  lastname: 'Calvin',
  company_id: company1.id,
  address: '142 rue du Cotentin, 44000 Nantes',
  phone: '0642457895',
  NIR: '185021708565428',
  conges_spectacles: '98746421',
  date_of_birth: Date.new(1981, 5, 28),
  place_of_birth: 'Vendôme',
  departement_of_birth: '41',
  country_of_birth: 'France'
)
fabrice = Employee.create!(
  firstname: 'Fabrice',
  lastname: 'Le Meunier',
  company_id: company2.id,
  address: "8 allée des grands sages, 22300 Ploubezre",
  phone: '0785458326',
  NIR: '011100110001111',
  conges_spectacles: '12345678',
  date_of_birth: Date.new(1951, 11, 2),
  place_of_birth: 'Montreuil',
  departement_of_birth: '63',
  country_of_birth: 'France'
)
mamadou = Employee.create!(
  firstname: 'Mamadou',
  lastname: 'Cissoko',
  company_id: company3.id,
  address: "34 rue des Deux Chouettes, 35000 Rennes",
  phone: '0788556699',
  NIR: '336633663336633',
  conges_spectacles: '85285285',
  date_of_birth: Date.new(1992, 10, 5),
  place_of_birth: 'Bamako',
  departement_of_birth: '',
  country_of_birth: 'Mali'
)
luc = Employee.create!(
  firstname: 'Luc',
  lastname: 'Mosebacke',
  company_id: company1.id,
  address: '32 passage de la coline, 25660 Montfaucon',
  phone: '0698798798',
  NIR: '555445554445544',
  conges_spectacles: '45645645',
  date_of_birth: Date.new(1962, 9, 12),
  place_of_birth: 'Villedieu',
  departement_of_birth: '84',
  country_of_birth: 'France'
)
aline = Employee.create!(
  firstname: 'Aline',
  lastname: 'Berthet',
  company_id: company2.id,
  address: '366 place des monuments aux vétérans, 55800 Argenton-le-Pont',
  phone: '0685789445',
  NIR: '225413584684585',
  conges_spectacles: '12312531',
  date_of_birth: Date.new(2000, 1, 2),
  place_of_birth: 'Châlon-sur-Saône',
  departement_of_birth: '71',
  country_of_birth: 'France'
)
luc2 = Employee.create!(
  firstname: 'Luc',
  lastname: 'Mosebacke',
  company_id: company1.id,
  address: '32 passage de la coline, 25660 Montfaucon',
  phone: '0698798798',
  NIR: '555445554445544',
  conges_spectacles: '45645645',
  date_of_birth: Date.new(1962, 9, 12),
  place_of_birth: 'Villedieu',
  departement_of_birth: '84',
  country_of_birth: 'France'
)
aline2 = Employee.create!(
  firstname: 'Aline',
  lastname: 'Berthet',
  company_id: company2.id,
  address: '366 place des monuments aux vétérans, 55800 Argenton-le-Pont',
  phone: '0685789445',
  NIR: '225413584684585',
  conges_spectacles: '12312531',
  date_of_birth: Date.new(2000, 1, 2),
  place_of_birth: 'Châlon-sur-Saône',
  departement_of_birth: '71',
  country_of_birth: 'France'
)

puts 'Employees created'

puts 'Creating contributions'

load Rails.root.join('db', 'seed_data', 'contributions_data.rb')
common_contributions = []
@common_contributions_array.each { |c| common_contributions << Contribution.create!(c) }

puts 'Contributions created'

puts 'Creating job profiles and their links to contributions'

jobs_list = {
  nartistsnc:[
    "Accessoiriste",
    "Administrateur/Administratrice de production",
    "Administrateur/Administratrice de tournée",
    "Architecte décorateur",
    "Armurier/Armurière",
    "Technicien/Technicienne de pyrotechnie",
    "Chargé(e) de production"
  ],
  nartistsc:[
    "Régisseur/Régisseuse de scène",
    "Régisseur/Régisseuse général",
    "Régisseur/Régisseuse lumière",
    "Régisseur/Régisseuse plateau",
    "Régisseur/Régisseuse son",
    "Directeur/Directrice de production",
    "Directeur/Directrice technique"
  ],
  artistsnc:[
    "Artiste lyrique",
    "Musicien(ne)",
    "Artiste chorégraphe",
    "Artiste de variété",
    "Arrangeur-orchestrateur/Arrangeuse-orchestratrice/",
    "Artiste dramatique"
  ],
  artistsc:[
    "Réalisateur/Réalisatrice coiffure, perruques",
    "Réalisateur/Réalisatrice",
    "Réalisateur/Réalisatrice costumes",
    "Réalisateur/Réalisatrice lumière",
    "Réalisateur/Réalisatrice son",
    "Directeur/Directrice artistique"
  ]
}

jobs_list[:nartistsnc].each do |job|
  job_profile = JobProfile.create!(artist: false, executive: false, name: job)
  common_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

jobs_list[:nartistsc].each do |job|
  JobProfile.create!(artist: false, executive: true, name: job)
  common_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

jobs_list[:artistsnc].each do |job|
  JobProfile.create!(artist: true, executive: false, name: job)
  common_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

jobs_list[:artistsc].each do |job|
  JobProfile.create!(artist: true, executive: true, name: job)
  common_contributions.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

puts 'Job profiles created'

puts 'creating payslips'

payslips = {
  payslip_number: 1,
  employee_id: [jean.id, fabrice.id, mamadou.id, luc.id, aline.id, luc2.id,aline2.id],
  artists: [jean.id, aline.id, luc2.id,aline2.id],
  nartists: [fabrice.id, mamadou.id, luc.id],
  company_id: [company1.id, company2.id, company3.id, company1.id, company2.id, company3.id, company3.id],
  performance_id: [p1.id, p2.id, p3.id, p1.id, p2.id, p3.id, p3.id]
}

payslips[:artists].each_with_index do |employee_id, index|
  Payslip.create!(
    payslip_number: 1,
    employee_id: employee_id,
    company_id: payslips[:company_id][index],
    job_profile: JobProfile.last.name,
    contract_start: '2018-01-12',
    contract_end: '2018-01-13',
    payment_date: '2018-01-17',
    payment_id: 'virement n°5624927892',
    performance_id: payslips[:performance_id][index],
    hours_per_day: 8,
    number_of_days: 2,
    executive: true,
    allowance: 1,
    basis: 212.00,
    basis_per_day: 106.00,
    allowance_basis: 212.00,
    number_of_hours: 16,
    employer_s_contribution: 115.09,
    employee_s_contribution: 52.77,
    net_salary: 159.23,
    taxable_net: 165.30,
    urssaf_limit: 400.00,
    employer_cost: 286.68,
    number_of_performance: 0,
    number_of_rehearsal: 0,
    gross_salary_accumulation: 138,
    taxable_net_accumulation: 109.93,
    net_accumulation: 105.98,
    urssaf_limit_accumulation: 288.00,
    employer_cost_accumulation: 214.20,
    hours_accumulation: 12,
    artist: true
  )
end

payslips[:nartists].each_with_index do |employee_id, index|
  Payslip.create!(
    payslip_number: 1,
    employee_id: employee_id,
    company_id: payslips[:company_id][index],
    job_profile: JobProfile.first.name,
    contract_start: '2018-01-12',
    contract_end: '2018-01-13',
    payment_date: '2018-01-17',
    payment_id: 'virement n°5624927892',
    performance_id: payslips[:performance_id][index],
    hours_per_day: 8,
    number_of_days: 2,
    executive: false,
    allowance: 1,
    basis: 212.00,
    basis_per_day: 106.00,
    allowance_basis: 212.00,
    number_of_hours: 16,
    employer_s_contribution: 115.09,
    employee_s_contribution: 52.77,
    net_salary: 159.23,
    taxable_net: 165.30,
    urssaf_limit: 400.00,
    employer_cost: 286.68,
    number_of_performance: 0,
    number_of_rehearsal: 0,
    gross_salary_accumulation: 138,
    taxable_net_accumulation: 109.93,
    net_accumulation: 105.98,
    urssaf_limit_accumulation: 288.00,
    employer_cost_accumulation: 214.20,
    hours_accumulation: 12,
    artist: false
  )
end

puts 'Payslips created'

puts 'Creatings payslips to contributions links'

all_payslips = Payslip.all
all_payslips.each do |payslip|
  PayslipsToContributionsLink.create!(payslip:, contribution: temp)
end

puts 'Payslips to contributions links created'
