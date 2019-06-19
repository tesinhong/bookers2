Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'homes_about'

  devise_for :users

  resources:books
  resources:users,only:[:index,:show,:edit,:update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
