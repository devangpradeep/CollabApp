Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  resource :posts do 
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end 
  # Defines the root path route ("/")
  root "pages#index"
  
end

