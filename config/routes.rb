Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :connections, only:[:index :show]
  end
  resources :users do
    resources :documents, only:[:index :show :create :destroy :edit ]
  end
end
