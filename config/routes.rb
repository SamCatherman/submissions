Rails.application.routes.draw do
  root 'submissions#index'

  resources :submissions
  resources :users
  resource  :session

end
