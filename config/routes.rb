Rails.application.routes.draw do

  resources :infos
  resources :results

  devise_for :users, :controllers => {
    registrations: 'registrations',
    sessions: 'sessions'
  }

  put 'infos', to: 'infos#update'

  post '/create/results', to: 'results#create'

end
