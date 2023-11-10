Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  # get '/post/:id', to: 'posts#show', as: 'post'
  # get '/post/:id/edit', to: 'posts#edit', as: 'edit_post'
  resources :posts do 
    collection do
      get 'hobby'
      get 'study'
      get 'team'
      get 'my'
    end
    
  end 
  # Defines the root path route ("/")
  root "pages#index"
  
end

