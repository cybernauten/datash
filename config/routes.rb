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
          resources :projects
          resources :teams do
            resources :linkedconnections, only:[:new, :create, :update, :destroy]
            resources :projects do
              resources :documents, only:[:index, :show, :create, :destroy, :edit, :update, :new ]
              resources :assignments, only:[:create, :update, :new]
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
