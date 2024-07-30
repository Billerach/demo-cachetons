class ApplicationController < ActionController::Base
  def favicon
    send_file Rails.root.join('public/favicon.ico'), type: 'image/x-icon', disposition: 'inline'
  end
end
