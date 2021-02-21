Rails.application.routes.draw do
  get 'messenger', to: 'messengers#index'
  get 'get_private_conversation', to: 'messengers#get_private_conversation'
  get 'get_group_conversation', to: 'messengers#get_group_conversation'
  get 'open_messenger', to: 'messengers#open_messenger'

  resources :contacts, only: [:create, :update, :destroy]

  namespace :group do
    resources :conversations do
      member do
        post :close
        post :open
      end
    end
    resources :messags, only: [:index, :create]
  end

  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end

  namespace :private do
    resources :conversations, only: [:create] do
      member do
        post :close
        post :open
      end
    end
    resources :messages, only: [:index, :create]
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, :controllers => {
    :registrations => "registrations"
  }
  root to: 'pages#index'
end
