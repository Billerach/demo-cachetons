# frozen_string_literal: true

# require 'open-uri'

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
  address: '3 rue dugenou, 44156 Pâté-sur-mer',
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

p1 = Performance.create!(company_id: company1.id, name: 'To be',             num_objet: '123Z68686634')
p2 = Performance.create!(company_id: company2.id, name: 'La Déglingue',      num_objet: '321Z68686635')
p3 = Performance.create!(company_id: company3.id, name: 'Mais oui mais non', num_objet: '741Z68686147')

Performance.create!(company_id: company1.id, name: 'Jeux de Pouvoirs',               num_objet: '456Z68686661')
Performance.create!(company_id: company1.id, name: 'Les Désossés',                   num_objet: '286Z68686628')
Performance.create!(company_id: company1.id, name: 'Martine chez les bonnes soeurs', num_objet: '789Z68686613')
Performance.create!(company_id: company1.id, name: 'Pli Pla Plou',                   num_objet: '147Z68686605')
Performance.create!(company_id: company1.id, name: 'Partout',                        num_objet: '285Z68686601')
Performance.create!(company_id: company2.id, name: 'Nulle Part Ici',                 num_objet: '369Z68686689')
Performance.create!(company_id: company2.id, name: 'Duvel et des pelles',            num_objet: '654Z68686477')
Performance.create!(company_id: company2.id, name: 'Paroles !',                      num_objet: '987Z68686111')
Performance.create!(company_id: company3.id, name: "Sans dec'",                      num_objet: '159Z68686789')
Performance.create!(company_id: company3.id, name: 'Le Grand Barzingue',             num_objet: '296Z68686456')

puts 'Performances created'

puts 'Creating employees'

jean_mich = Employee.create!(
  firstname: 'Jean-Mich',
  lastname: 'Wallouhoualla',
  company_id: company1.id,
  address: '142 rue du Cotentin, 44000 Nantes',
  phone: '0642457895',
  NIR: '185021708565428',
  conges_spectacles: '98746421',
  date_of_birth: Date.new(1981, 5, 28),
  place_of_birth: 'Pétaouchnok',
  departement_of_birth: '28',
  country_of_birth: 'France'
)
fabrice = Employee.create!(
  firstname: 'Fabrice',
  lastname: 'Le Meunier',
  company_id: company2.id,
  address: "8 allée des grands sages, 29400 Ploumeuneuc'h",
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
  address: "34 rue de l'Ouganda, 35000 Rennes",
  phone: '0788556699',
  NIR: '336633663336633',
  conges_spectacles: '85285285',
  date_of_birth: Date.new(1992, 10, 5),
  place_of_birth: 'Bamako',
  departement_of_birth: '',
  country_of_birth: 'Mali'
)
luke = Employee.create!(
  firstname: 'Luke',
  lastname: 'Skywalker',
  company_id: company1.id,
  address: '32 passage du trou, 25060 Montcuq',
  phone: '0698798798',
  NIR: '555445554445544',
  conges_spectacles: '45645645',
  date_of_birth: Date.new(1962, 9, 12),
  place_of_birth: 'Villedieu-Les-Poêles-sur-Saône',
  departement_of_birth: '77',
  country_of_birth: 'France'
)
albert = Employee.create!(
  firstname: 'Albert',
  lastname: 'de la Grenouillères des Andes',
  company_id: company2.id,
  address: '366 place des monuments aux vétérans, 55800 Argenton-le-Pont',
  phone: '0685789445',
  NIR: '225413584684585',
  conges_spectacles: '12312531',
  date_of_birth: Date.new(2000, 1, 2),
  place_of_birth: 'Châlon-sur-Saône',
  departement_of_birth: '28',
  country_of_birth: 'France'
)
luke2 = Employee.create!(
  firstname: 'Luke',
  lastname: 'Skywalker',
  company_id: company3.id,
  address: '32 passage du trou, 25060 Montcuq',
  phone: '0698798798',
  NIR: '555445554445544',
  conges_spectacles: '45645645',
  date_of_birth: Date.new(1962, 9, 12),
  place_of_birth: 'Villedieu-Les-Poêles-sur-Saône',
  departement_of_birth: '77',
  country_of_birth: 'France'
)
albert2 = Employee.create!(
  firstname: 'Albert',
  lastname: 'de la Grenouillères des Andes',
  company_id: company3.id,
  address: '366 place des monuments aux vétérans, 55800 Argenton-le-Pont',
  phone: '0685789445',
  NIR: '225413584684585',
  conges_spectacles: '12312531',
  date_of_birth: Date.new(2000, 1, 2),
  place_of_birth: 'Châlon-sur-Saône',
  departement_of_birth: '28',
  country_of_birth: 'France'
)

puts 'Employees created'

puts 'Creating contributions'

used_contributions = {
  fund: [
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'Assedic',
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'Audiens',
    'Audiens',
    'Audiens',
    'Audiens',
    'CMB',
    'URSSAF',
    'URSSAF',
    'FNAS',
    'FCAP'
  ],
  name: [
    '100 RG Base déplafonnée :  maladie, maternité, invalidité, décès, solidarité.',
    '100D RG Base déplafonnée : allocations familiales.',
    '100P RG Base plafonnée (vieillesse).',
    'CSG déductible.',
    "104 Assur. Chômage + 125 CDD contrat d'usage de - de 3 mois.",
    '312D Artistes : vieillesse.',
    '312A Artistes Accident du travail (code risque : 923AC).',
    '334P FNAL Artistes et médecins - de 20 salariés.',
    'Retraite ARRCO artiste non cadre Tranche A.',
    'Retraite ARRCO non artiste non cadre Tranche A.',
    'Prévoyance Artiste NC T1.',
    'Prévoyance NC T1.',
    'Médecine du travail (+ TVA à 20%).',
    '671P Réduction Fillon Base plafonnée.',
    '027D Contribution au dialogue social',
    "Fond National d'Activités Sociales des entreprises artistiques et culturelles.",
    "Fond Commun d'Aide au Paritarisme"
  ],
  employee_part: [0, 0, 0.069, 0.068, 0.0335, 0.0028, 0, 0, 0.0437, 0.0387, 0, 0, 0, 0, 0, 0, 0],
  employer_part: [0.133, 0.03450, 0.08550, 0, 0.09551, 0.01331, 0.01191, 0.00071, 0.04380, 0.03880,
                  0.00420, 0.00420, 0.00381, 0.28090, 0.0001, 0.01251, 0.00251],
  start_date: '2023-01-01',
  end_date: '2023-12-31'
}

used_contributions_array = []
used_contributions[:fund].each_with_index do |fund, index|
  used_contributions_array << Contribution.create!(
    fund:,
    name: used_contributions[:name][index],
    employee_part: used_contributions[:employee_part][index],
    employer_part: used_contributions[:employer_part][index],
    start_date: used_contributions[:start_date],
    end_date: used_contributions[:end_date]
  )
end

unused_contributions = {
  fund: [
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'URSSAF',
    'Assedic',
    'Audiens',
    'Audiens',
    'Audiens',
    'CS',
    'AFDAS',
    'Audiens',
    'URSSAF',
    'AUDIENS',
    'AUDIENS'
  ],
  name: [
    '100D RG Base déplafonnée : vieillesse',
    '100A RG Accident du travail (code risque : 923AD).',
    '332P FNAL cas général et sect. public - de 20 salariés.',
    'CSG/CRDS imposable.',
    '312D Artistes :  maladie, maternité, invalidité, décès, solidarité.',
    '312D Artistes : allocations familiales.',
    '312P Artistes vieillesse.',
    '301 AGS.',
    'Retraite ARRCO cadres Tranche A + APEC',
    'AGFF Tranche A (ARRCO).',
    'Prévoyance Artiste Cadre T1.',
    'Congés Spectacles.',
    'Congés Formation (+ TVA à 20%).',
    'CET Tranche A.',
    '100A RG Accident du travail (code risque : 923AD).',
    'Garantie minimale de points (GMP)',
    'Garantie minimale de points (GMP)'
  ],
  employee_part: [0.004, 0, 0, 0.029, 0, 0, 0.0483, 0, 0.03894, 0.008, 0, 0, 0, 0.0013, 0, 1.42, 1.52],
  employer_part: [0.019, 0.017, 0.001, 0, 0.094, 0.02421, 0.05991, 0.00151, 0.0391, 0.012, 0.01951, 0.152,
                  0.02521, 0.00221, 0.017, 2.32, 2.48],
  start_date: '2023-01-01',
  end_date: '2023-12-31'
}

unused_contributions[:fund].each_with_index do |fund, index|
  Contribution.create!(
    fund:,
    name: used_contributions[:name][index],
    employee_part: used_contributions[:employee_part][index],
    employer_part: used_contributions[:employer_part][index],
    start_date: used_contributions[:start_date],
    end_date: used_contributions[:end_date]
  )
end

puts 'Contributions created'

puts 'Creating job profiles'

txt = File.read(Rails.root.join('liste_metiers_techos_admin.txt'))
array = txt.split(',')
array.pop
array.each do |job|
  JobProfile.create!(artist: false, executive: false, name: job)
  JobProfile.create!(artist: false, executive: false, name: job)
end

puts 'Job profiles created'

puts 'creating job profiles to contributions links'

all_job_profiles = JobProfile.all
all_job_profiles.each do |job_profile|
  used_contributions_array.each do |contribution|
    JobProfilesToContributionsLink.create!(job_profile:, contribution:)
  end
end

puts 'job profiles to contributions links created'

puts 'creating payslips'

payslips = {
  payslip_number: 1,
  employee_id: [jean_mich.id, fabrice.id, mamadou.id, luke.id, albert.id, luke2.id,albert2.id],
  company_id: [company1.id, company2.id, company3.id, company1.id, company2.id, company3.id, company3.id],
  contract_start: '2018-01-12',
  contract_end: '2018-01-13',
  payment_date: '2018-01-17',
  performance_id: [p1.id, p2.id, p3.id, p1.id, p2.id, p3.id, p3.id],
  hours_per_day: 8,
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
}

payslips[:employee_id].each_with_index do |employee_id, index|
  Payslip.create!(
    payslip_number: 1,
    employee_id: employee_id,
    company_id: payslips[:company_id][index],
    job_profile: JobProfile.first.name,
    contract_start: '2018-01-12',
    contract_end: '2018-01-13',
    payment_date: '2018-01-17',
    performance_id: payslips[:performance_id][index],
    hours_per_day: 8,
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
  used_contributions_array.each do |contribution|
    PayslipsToContributionsLink.create!(payslip:, contribution:)
  end
end

puts 'Payslips to contributions links created'
