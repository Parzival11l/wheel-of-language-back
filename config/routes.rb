Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'user/registrations'
  }

  get 'persons/profile', as: 'user_root'

  root 'home#index'

end
