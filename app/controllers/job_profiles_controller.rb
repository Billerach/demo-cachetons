class JobProfilesController < ApplicationController

  def index
    @job_profiles = JobProfile.all
  end

  def show
    @job_profile = JobProfile.find(params[:id])
  end

  def new
    @contributions = Contribution.all
    @job_profile = JobProfile.new
  end

  def create
    if test_empty_needed_fields(job_profile_params)
      create_error_message('Vous devez entrer un nom et des cotisations dans votre modèle de fiche de paie !')
    else
      @job_profile = JobProfile.create!(name: job_profile_params[:name])
      job_profile_bool(job_profile_params)
      create_links(job_profile_params[:contributions_ids])
      if @job_profile.save
        notice = 'Nouveau modèle créé'
      else
        notice = "Impossible d'enregistrer le modèle. Contactez votre administrateur"
      end
      redirect_to @job_profile, notice:
    end
  end

  def destroy
    @job_profile = JobProfile.find(params[:id])
    @job_profile.job_profiles_to_contributions_links.destroy_all
    @job_profile.destroy
    notice = "Le modèle #{@job_profile.name} a été supprimé définitivement."
    redirect_to job_profiles_path, notice:
  end

  def edit
    @job_profile = JobProfile.find(params[:id])
    @contributions = Contribution.all
  end

  def update
    @job_profile = JobProfile.find(params[:id])
    job_profile_bool(job_profile_params)
    @job_profile.name = job_profile_params[:name]
    destroy_links
    create_links(job_profile_params[:contributions_ids])
    redirect_to @job_profile, notice: "#{@job_profile.name} mis à jour." if @job_profile.save
  end

  private

  def job_profile_params
    params.require(:job_profile).permit(:name, :executive, :artist, contributions_ids: [])
  end

  def create_links(list)
    new_contributions_ids = list.select { |id| id.present?}
    @job_profile.contributions << Contribution.find(new_contributions_ids)
  end

  def destroy_links
    @job_profile.job_profiles_to_contributions_links.destroy_all
  end

  def create_error_message(notice)
    redirect_to new_job_profile_url, notice:
  end

  def test_empty_needed_fields(fields)
    fields[:contributions_ids].nil? || fields[:name] == ''
  end

  def job_profile_bool(bool)
    @job_profile.artist = bool[:artist] == '1'
    @job_profile.executive = bool[:executive] == '1'
  end
end
