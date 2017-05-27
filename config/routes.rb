Rails.application.routes.draw do

  devise_for :people
  root 'top#index'

  get 'dashboard' => 'dashboard#index'
end
