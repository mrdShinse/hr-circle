Rails.application.routes.draw do

  devise_for :people
  root 'top#index'

  get 'dashboard' => 'dashboard#index'

  resources :job_offers do
  end
end
