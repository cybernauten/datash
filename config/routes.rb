Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
      resources :users do
        resources :linkedconnections, only:[:index, :show]
        resources :documents, only:[:index, :show, :create, :destroy, :edit, :update, :new ]
        resources :assignments, only:[:index, :show]
        resources :projects, only:[:index, :show, :new, :create]
        resources :teams, except:[:destroy] do
          resources :linkedconnections, only:[:create, :update]
          #resources :cooperations, only:[:create, :update]
          resources :projects do
            #resources :cooperations, only:[:create, :update]
            resources :documents, only:[:index, :show, :create, :destroy, :edit, :update, :new ]
            resources :assignments, only:[:create, :update]
          end
        end
        get 'recent', to: 'pages#recent'
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
