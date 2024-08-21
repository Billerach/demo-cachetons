Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :companies do
    resources :payslips, except: %i[update destroy create]
    patch '/payslips/:id', to: 'payslips#update', as: :payslip_update
    delete '/payslips/:id', to: 'payslips#destroy', as: :payslip_destroy
    post '/payslips', to: 'payslips#create', as: :payslip_create
    resources :company_links, only: [:create]
    resources :employees, except: [:index]
    resources :performances, except: %i[index new show]
  end

  resources :job_profiles
  resources :contributions

  get 'favicon.ico', to: 'application#favicon'
end
