Rails.application.routes.draw do
  devise_for :people
  root 'top#index'

  get 'dashboard' => 'dashboard#index'

  resources :job_offers

  resources :circles do
    resources :job_offers
  end

  namespace :admin do
    resource  :organization, only: %i[show edit update]
    resources :users
    resources :job_offers
  end
end
