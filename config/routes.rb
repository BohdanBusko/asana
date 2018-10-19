Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  namespace :account do
    get '/dashboard', to: 'dashboard#index'
    resources :projects do
      resources :sections, except: [:index, :show] do
        resources :tasks, except: [:index]
        put '/task/:id/:move', to: 'tasks#move', as: 'task_move'
      end
    end
  end
end
