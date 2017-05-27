Rails.application.routes.draw do

  root 'top#index'

  get 'dashboard' => 'dashboard#index'
end
