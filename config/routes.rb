Rails.application.routes.draw do

  resources :problems, except: [:new, :create] do
    resources :solutions, only: [:new,:create]
  end

  resources :quizzes do
    resources :problems, only: [:new,:create] do
      resources :solutions, only: [:new,:create]
    end
  end

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
    resources :cards, only:[:new, :create, :destroy]
  end

  resources :notes do
    resources :libraries, :only =>[:create]
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]


  resources :users, controller: "users" do
      resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  root "home#home"

  get 'tags/:tag', to: 'questions#index', as: :tag
  delete "/notes/:id/libraries/:count" => "notes#remove", as: :libdel

  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

end
