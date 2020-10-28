Rails.application.routes.draw do
  namespace :api do
    get "/all_products_path" => "products#products_action"

    get "/blender_path" => "products#blender"

    get "/dutch_oven_path" => "products#dutch_oven"
  end
end
