Rails.application.routes.draw do

  resources :infos
  resources :results
  resources :sessions
  resources :registrations

  devise_for :users, :controllers => {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  devise_for :infos, :controllers => {
    infos: 'infos'
  }
  devise_for :results, :controllers => {
    result: 'results'
  }

  get 'persons/profile', as: 'user_root'

  root 'users#index'

end
