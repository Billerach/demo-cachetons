class PayslipsController < ApplicationController
  def index
    @payslips = set_payslips
    @company = Company.find(params[:company_id])
    @payslip = Payslip.new
  end

  def show
    @payslip = Payslip.find(params[:id])
  end

  def create
    @payslip = Payslip.new
    @company = Company.find(params[:company_id].to_i)
    payslip_creation
    if @payslip.save
      redirect_to edit_company_payslip_url(@company, @payslip)
    else
      redirect_to company_payslips_url, alert: 'Impossible de créer la fiche de paie. Contactez le support.'
    end
  end

  def edit
    @payslip = Payslip.find(params[:id])
    job_profile_load(@payslip.job_profile, @payslip) if @payslip.job_profile.to_i != 0
  end

  def update
    @payslip = Payslip.find(params[:id])
    @payslip.update(payslip_update_params)
    payslip_data
    redirect_to company_payslip_path(@payslip.company, @payslip)
  end

  def destroy
    @payslip = Payslip.find(params[:id])
    @payslip.payslips_to_contributions_links.destroy_all
    @payslip.destroy
    notice_content = "#{@payslip.employee.firstname} #{@payslip.employee.lastname} n°#{@payslip.payslip_number}"
    notice = "La fiche de paie de #{notice_content} a été supprimée définitivement."
    redirect_to company_payslips_url, notice:
  end

  private

  def payslip_params
    params.require(:payslip).permit(:employee_id, :performance_id, :contract_start, :job_profile)
  end

  def payslip_creation
    payslip_params_hydratation
    @payslip.update(company: @company, employee: @employee, performance: @performance)
    @payslip.contract_start = payslip_params[:contract_start]
    @payslip.payslip_number = payslip_number_generator(@payslip.employee)
    @job_profile.contributions.each { |contribution| @payslip.contribution << contribution }
  end

  def payslip_params_hydratation
    @employee = Employee.find(payslip_params[:employee_id])
    @performance = Performance.find(payslip_params[:performance_id])
    @job_profile = JobProfile.find(payslip_params[:job_profile])
  end

  def payslip_number_generator(employee)
    test = Payslip.where(employee: employee.id).order(payslip_number: :desc).limit(1)[0]
    if test.nil?
      1
    else
      test.payslip_number + 1
    end
  end

  def set_payslips
    if params[:performance]
      request = { company_id: params[:company_id], performance_id: params[:performance] }
    else
      request = { company_id: params[:company_id] }
    end

    Payslip.where(request)
  end

  def payslip_update_params
    params.require(:payslip).permit(
      :contract_start,
      :contract_end,
      :payment_date,
      :payment_id,
      :number_of_rehearsal,
      :number_of_performance,
      :hours_per_day,
      :basis
    )
  end

  def job_profile_load(job_profile_id, payslip)
    job_profile = JobProfile.find(job_profile_id.to_i)
    contributions_list_array = JSON.parse(job_profile.contributions_list)
    contributions_list_array.each do |contribution_id|
      contribution = Contribution.find(contribution_id)
      ContributionsLink.create!(payslip: payslip, contribution: contribution)
    end
    @payslip.job_profile = job_profile.name
    @payslip.artist = job_profile.artist
    @payslip.executive = job_profile.executive
    @payslip.save
  end

  def payslip_data
    @payslip.number_of_days = (@payslip.contract_end - @payslip.contract_start).to_i + 1
    @payslip.basis_per_day = @payslip.basis / @payslip.number_of_days
    @payslip.number_of_hours = number_of_hours
    total_contribution
    @payslip.net_salary = @payslip.basis - @payslip.employee_s_contribution
    @payslip.taxable_net = taxable_net
    @payslip.urssaf_limit = @payslip.number_of_hours * 27# 27 est le plafond horaire 2023 - Ajouter plus tard la gestion des taux et plafonds communs à tous
    @payslip.employer_cost = @payslip.basis + @payslip.employer_s_contribution
    accumulations
    @payslip.save
  end

  def total_contribution
    employee_part_rate = 0
    employer_part_rate = 0
    @payslip.contributions.each do |contribution|
      employee_part_rate += contribution.employee_part
      employer_part_rate += contribution.employer_part
    end
    @payslip.employee_s_contribution = @payslip.basis * employee_part_rate
    @payslip.employer_s_contribution = @payslip.basis * employer_part_rate
  end

  def number_of_hours
    if @payslip.artist?
      (@payslip.number_of_rehearsal * 4) + (@payslip.number_of_performance * 12)
    else
      @payslip.number_of_hours = @payslip.hours_per_day * @payslip.number_of_days
    end
  end

  def taxable_net
    taxable_csg_and_crds = @payslip.contributions.where(name: "CSG/CRDS imposable.")
    if taxable_csg_and_crds[0].nil?
      taxable_csg_and_crds_rate = 0
    else
      taxable_csg_and_crds_rate = taxable_csg_and_crds[0][:employee_part]
    end
    @payslip.net_salary + (taxable_csg_and_crds_rate * @payslip.basis)
  end

  def accumulations
    all_payslips = Payslip.where(employee: @payslip.employee.id)
    previous_payslips = all_payslips - [all_payslips.last]

    gross_salary_accumulation = @payslip.basis
    taxable_net_accumulation = @payslip.taxable_net
    net_accumulation = @payslip.net_salary
    urssaf_limit_accumulation = @payslip.urssaf_limit
    employer_cost_accumulation = @payslip.employer_cost
    hours_accumulation = @payslip.number_of_hours

    previous_payslips.each do |payslip|
      gross_salary_accumulation  += payslip.basis
      taxable_net_accumulation   += payslip.taxable_net
      net_accumulation           += payslip.net_salary
      urssaf_limit_accumulation  += payslip.urssaf_limit
      employer_cost_accumulation += payslip.employer_cost
      hours_accumulation         += payslip.number_of_hours
    end
    @payslip.gross_salary_accumulation  = gross_salary_accumulation
    @payslip.taxable_net_accumulation   = taxable_net_accumulation
    @payslip.net_accumulation           = net_accumulation
    @payslip.urssaf_limit_accumulation  = urssaf_limit_accumulation
    @payslip.employer_cost_accumulation = employer_cost_accumulation
    @payslip.hours_accumulation         = hours_accumulation
  end
end
