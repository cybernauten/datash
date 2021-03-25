Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  devise_scope :user do
    authenticated :user do
      root 'pages#recent', as: :authenticated_root
      resources :users do
          resources :linkedconnections
          resources :documents, only:[:index, :show, :create, :destroy, :edit, :update, :new ]
          resources :assignments
          resources :projects
          resources :teams do
            resources :linkedconnections
            resources :projects do
              resources :documents, only:[:index, :show, :create, :destroy, :edit, :update, :new ]
              resources :assignments
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
