Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "welcome#index"

  resources :nannies
  resources :on_side_nannies, :only => [:new]
  resources :in_home_nannies, :only => [:new]
  resources :users

  namespace :admin do
  	resources :users, :only => [:update]
	end

end
