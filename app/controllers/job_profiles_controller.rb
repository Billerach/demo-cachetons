class JobProfilesController < ApplicationController
  DEMO_USER = User.where(email: "demo@cachetons.com").first #TODO : à SUPPRIMER pour la version normale

  def index
    @job_profiles = DEMO_USER.job_profiles
  end

  def show
    @job_profile = JobProfile.find(params[:id])
  end

  def new
    @contributions = Contribution.all
  end

  def create
    if test_empty_needed_fields(job_profile_params)
      create_error_message('Vous devez entrer un nom et des cotisations dans votre modèle de fiche de paie !')
    else
      @job_profile = JobProfile.create!(user: DEMO_USER, name: job_profile_params[:name])
      job_profile_bool(job_profile_params)
      create_links(job_profile_params[:contributions_list])
      redirect_to @job_profile, notice: 'Nouveau modèle créé' if @job_profile.save
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
    new
  end

  def update
    @job_profile = JobProfile.find(params[:id])
    job_profile_bool(job_profile_params)
    destroy_links
    create_links(job_profile_params[:contributions_list])
    redirect_to @job_profile, notice: "#{@job_profile.name} mis à jour." if @job_profile.save
  end

  private

  def job_profile_params
    params.require(:job_profile).permit(:name, :executive, :artist, contributions_list: [])
  end

  def create_links(list)
    new_contributions_ids = list.map(&:to_i)
    @job_profile.contributions << Contribution.find(new_contributions_ids)
  end

  def destroy_links
    @job_profile.job_profiles_to_contributions_links.destroy_all
  end

  def create_error_message(notice)
    redirect_to new_job_profile_url, notice:
  end

  def test_empty_needed_fields(fields)
    fields[:contributions_list].nil? || fields[:name] == ''
  end

  def job_profile_bool(bool)
    @job_profile.artist = bool[:artist] == '1'
    @job_profile.executive = bool[:executive] == '1'
  end
end
