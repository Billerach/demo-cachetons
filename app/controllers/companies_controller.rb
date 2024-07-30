class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Structure ajoutée"
    else
      @companies = Company.all
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @company = Company.find(params[:id])
    @performances = Performance.where(company: @company)
    @employee = Employee.new(company: @company)
    @performance = Performance.new(company: @company)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    redirect_to @company, notice: 'Les données de la structure ont été mises à jour.' if @company.update(company_params)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path, "#{@company.name} a été supprimé définitivement."
  end

  private

  def company_params
    params.require(:company).permit(:name, :siret, :naf, :address, :license_number)
  end
end
