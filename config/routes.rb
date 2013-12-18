require 'sidekiq/web'
Jct::Application.routes.draw do
  resources :statuses

  resources :projects, only: [:index, :show, :new, :create]

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    # get '/register' => 'devise/registrations#new'
  end

  get 'tour' => 'pages#tour', as: :tour
  get 'pricing' => 'pages#pricing', as: :pricing
  get 'terms' => 'pages#terms', as: :terms
  get 'help' => 'pages#help', as: :help
  get 'dashboard' => 'pages#dashboard', as: :dashboard
  get 'contact_us' => 'pages#contact_us', as: :contact_us

  mount Sidekiq::Web, at: '/sidekiq'

  authenticated :user do
    root to: 'pages#dashboard'
  end

  unauthenticated :user do
    devise_scope :user do
      get '/' => 'pages#index'
    end
  end
end
