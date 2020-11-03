Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"

    get "/products/:show" => "products#show"

    post "/products" => "products#create"

    patch "/products/:id" => "products#update"

    delete "/products/:id" => "products#destroy"
  end
end
