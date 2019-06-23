Rails.application.routes.draw do
  root 'home#top'
  get 'home/about', to: 'home#about', as: 'home_about'

  devise_for :users

  resources:books
  resources:users,only:[:index,:show,:edit,:update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
