Rails.application.routes.draw do




 root 'bookmarks#index'

 resources :bookmarks
 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]

end
