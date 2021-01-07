Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :connections, only:[:index, :show]
    # resources :documents # is it possible to do everything with the documents?
  end
  resources :users do
    resources :documents, only:[:index, :show, :create, :destroy, :edit ]
  end

  resources :teams, except:[:destroy] do
    resources :connections, only:[:create, :update]
    resources :cooperations, only:[:create, :update]
  end
end
