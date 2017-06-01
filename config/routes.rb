Rails.application.routes.draw do

  devise_for :people
  root 'top#index'

  get 'dashboard' => 'dashboard#index'

  resources :job_offers do
  end

  namespace :admin do
    resource  :organization, :only => [:show, :edit, :update]
    resources :users
    resources :circles
  end
end
