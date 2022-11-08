Rails.application.routes.draw do
  get "signup" => "users#new"
  # get "profile" => "users#show"\
  get "login" => "sessions#new"
  
  resources :sessions, except: [:index, :new, :edit, :update, :show]
  resources :users, except: [:index] 
  resources :posts do 
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'about' => "sites#about"
  # Defines the root path route ("/")
  root 'posts#index'
end
