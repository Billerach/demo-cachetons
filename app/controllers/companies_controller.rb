require_relative "../../lib/administrative_data/french_departments"

class CompaniesController < ApplicationController
  before_action :set_company, only: [:show,:edit,:update,:destroy]

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
    @performances = Performance.where(company: @company)
    @employee = Employee.new(company: @company)
    @performance = Performance.new(company: @company)
    @departments = FrenchDepartments.new.get
    @countries = countries_for_select
    raise
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

  def set_company
    @company = Company.find(params[:id])
  end

  def countries_for_select
    # countries = ISO3166::Country.all.map! { |country| [country.translations[I18n.locale.to_s], country.alpha2] }
    countries = ISO3166::Country.all.map! { |country| country.translations[I18n.locale.to_s] }
    raise
    countries.sort_by! { |country| country[0] }
  end
end
