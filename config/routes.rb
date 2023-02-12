Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 # namespace the controllers without affecting the URI
# module the controllers without affecting the URI
scope module: :v2, constraints: ApiVersion.new('v2') do
  resources :todos, only: :index
end

 scope module: :v1, constraints: ApiVersion.new('v1', true) do
  resources :todos do
    resources :items
  end
end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end
