Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'index', to: 'pages#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts
  
  resources :posts do
    resources :answers
  end

  resources :articles do
    resources :comments
  end
  
  root 'pages#index'    
end
