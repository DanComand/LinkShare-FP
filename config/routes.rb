Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]

  root 'bookmarks#index'

 	resources :bookmarks do
 		resources :notes, only: [:show, :create, :destory]
	end
end
