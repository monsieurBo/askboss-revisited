Rails.application.routes.draw do

  resources :answers, except: [:new,:create] do
    resource :votes, only: [:vote] do
      member do
        get 'vote'
      end
    end
  end

  resources :questions do
    resources :answers, only: [:new,:create]
    resource :votes, only: [:vote] do
      member do
        get 'vote'
      end
    end
  end

  resources :flash_cards do
    resources :cards, only:[:new, :create]
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]


  resources :users, controller: "users" do
    resources :libraries, :only =>[:create, :destroy]
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#home"

  get 'tags/:tag', to: 'questions#index', as: :tag

end
