Rails.application.routes.draw do

  root 'lists#index'

  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy'
  
  resources :users, only: [:new, :create, :show, :destroy]

  resources :invites, only: [:index, :show]
  
  resources :lists do
  	resources :invites, except: [:index]
    resources :bookmarks, shallow: true do
  			resources :notes, only: [:show, :create, :destory], shallow: true
  		end
  end
end
