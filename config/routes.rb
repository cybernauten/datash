Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :linkedconnections, only:[:index, :show]
    resources :documents # is it possible to do everything with the documents?
    resources :assignments, only:[:index, :show]
  end

  resources :users do
    resources :documents, only:[:index, :show, :create, :destroy, :edit, :update ]
    # why is user not together?
  end

  resources :teams, except:[:destroy] do
    resources :linkedconnections, only:[:create, :update]
    resources :cooperations, only:[:create, :update]
  end

  resources :projects do
    resources :cooperations, only:[:create, :update]
    resources :documents, only:[:index, :show, :create, :destroy, :edit, :update ]
    resources :assignments, only:[:create, :update]
  end

  #resources :projects do
  #  resources :assignments
  # end
end
