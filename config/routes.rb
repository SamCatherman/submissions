Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'show_session' => 'sessions#index'
  get 'set_session' => 'sessions#set_session'
  get 'another' => 'sessions#another'

  resources :submissions
  root 'submissions#index'
end
