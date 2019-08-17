Rails.application.routes.draw do
  root 'home#top'
  get 'home/about', to: 'home#about', as: 'home_about'

  devise_for :users

  resources:users,only:[:index,:show,:edit,:update]
  resources:books do
    resources :book_comments, only:[:create, :update, :destroy, :edit]
    resource :favorites, only:[:create, :destroy]
  end
  resources :relationships, only:[:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
