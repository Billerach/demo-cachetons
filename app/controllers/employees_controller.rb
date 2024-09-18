class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def create
    @employee = Employee.new
    company = Company.find(params[:company_id].to_i)
    @employee.company = company
    @employee.update(employee_params)
    if @employee.save
      redirect_to company_url(company)
    else
      alert = "Impossible d'ajouter l'employé'. Raison : #{@employee.errors.full_messages.to_sentence}."
      redirect_to company_url(company), alert:
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @company =  @employee.company
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    if @employee.save
      redirect_to company_employee_path(
        @employee.company,
        @employee
      ), notice: "Les données du salarié ont été mises à jour."
    else
      redirect_to edit_company_employee_path(@employee.company, @employee), notice: "Données incorrectes."
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.payslips.present?
      redirect_to company_employee_url(@employee), notice: "Il reste des fiches de paie rattachées à ce salarié"
    else
      @employee.destroy
      redirect_to company_url(@employee.company), notice: "Données du salarié supprimées"
    end
  end


  private

  def employee_params
    params.require(:employee).permit(
      :firstname,
      :lastname,
      :address,
      :phone,
      :phone_2,
      :NIR,
      :conges_spectacles,
      :date_of_birth,
      :place_of_birth,
      :departement_of_birth,
      :country_of_birth,
      :photo
    )
  end
end
