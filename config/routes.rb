Rails.application.routes.draw do



 root 'bookmarks#index'

 resources :bookmarks
 resources :users, only: [:new, :create]

end
