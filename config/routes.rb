Rails.application.routes.draw do
  get 'index', to: 'pages#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  devise_for :users
  # get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
    
  root 'welcome#index'
end
