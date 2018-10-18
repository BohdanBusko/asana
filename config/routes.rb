Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :account do
    get '/dashboard', to: 'dashboard#index'
    resources :projects do 
      resources :tasks
    end
  end
end
