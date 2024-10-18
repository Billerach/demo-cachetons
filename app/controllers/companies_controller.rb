require_relative "../../lib/administrative_data/french_departments"

class CompaniesController < ApplicationController
  before_action :set_company, only: [:show,:edit,:update,:destroy]

  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
    @company.save ? notice = "Structure ajoutée" : notice = "même nom qu'une structure existante"
    redirect_to companies_path, notice:
  end

  def show
  end

  def edit
  end

  def update
    redirect_to @company if @company.update(company_params)
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: "#{@company.name} a été supprimé définitivement."
  end

  private

  def company_params
    params.require(:company).permit(:name, :siret, :naf, :address, :license_number, :specialty)
  end

  def get_company
    @company = Company.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
