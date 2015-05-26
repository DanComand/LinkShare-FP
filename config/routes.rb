Rails.application.routes.draw do

	  resources :sessions, only: [:new, :create, :destroy]
	  resources :users, only: [:new, :create, :show, :destroy]

	  root 'lists#index'

	  resources :lists do
	  	resources :invites
			resources :bookmarks, shallow: true do
	 			resources :notes, only: [:show, :create, :destory], shallow: true
	 		end
	end

	resources :invites, only: [:show]
end
