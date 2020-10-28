Rails.application.routes.draw do
  namespace :api do
    get "/products_path" => "products#products_action"
  end
end
