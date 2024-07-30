class CompaniesController < ApplicationController
  # Sur tout le controleur, remettre current_user à la place de CURRENT_USER
  DEMO_USER = User.where(email: "demo@cachetons.com").first #TODO : à SUPPRIMER pour la version normale

  def index
    @companies = DEMO_USER.companies
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      @company_link = CompanyLink.new(user: DEMO_USER, company: @company)
      @company_link.save
      redirect_to companies_path, notice: "Structure ajoutée"
    else
      @companies = DEMO_USER.companies
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @company = Company.find(params[:id])
    @performances = Performance.where(company: @company)
    # Pour ajouter un user à une company :
    @company_link = CompanyLink.new(company: @company)
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
    # Si la company est liée à d'autres users, ne supprimer que la company_link
    if @company.users.length > 1
      @company_link = CompanyLink.find_by(user: @current_user, company: @company)
      @company_link.destroy
      notice = "#{@company.name} a été supprimé de vos structures."
    else
      @company.destroy
      notice = "#{@company.name} a été supprimé définitivement."
    end
    redirect_to companies_path, notice:
  end

  private

  def company_params
    params.require(:company).permit(:name, :siret, :naf, :address, :license_number)
  end
end
