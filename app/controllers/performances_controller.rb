class PerformancesController < ApplicationController
  def create
    @performance = Performance.new
    company = Company.find(params[:company_id].to_i)
    @performance.company = company
    @performance.update(performance_params)
    if @performance.save
      redirect_to company_url(company)
    else
      redirect_to company_url(company), alert: "Impossible d'ajouter l'employé'. Contactez le support."
    end
  end

  def edit
    @performance = Performance.find(params[:id])
    @company = @performance.company
  end

  def update
    @performance = Performance.find(params[:id])
    @performance.update(performance_params)
    if @performance.save
      redirect_to company_path(@performance.company), notice: "Les données du spectacle ont été mises à jour."
    else
      redirect_to company_path(@performance.company), notice: "Données incorrectes."
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    if @performance.payslips.present?
      redirect_to company_path(@performance.company), notice: "Il reste des fiches de paie rattachées à ce spectacle"
    else
      @performance.destroy
      redirect_to company_path(@performance.company), notice: "Spectacle supprimé"
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:name, :num_objet)
  end
end
