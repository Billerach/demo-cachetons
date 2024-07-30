class ApplicationController < ActionController::Base
  # before_action :authenticate_user! TODO : à REACTIVER pour la version normale
  DEMO_USER = User.where(email: "demo@cachetons.com").first #TODO : à SUPPRIMER pour la version normale

  def favicon
    send_file Rails.root.join('public/favicon.ico'), type: 'image/x-icon', disposition: 'inline'
  end
end
