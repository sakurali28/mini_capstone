Rails.application.routes.draw do
  namespace :api do
    get "/all_products_path" => "products#products_action"

    get "/blender_path" => "products#blender"

    get "/dutch_oven_path" => "products#dutch_oven"

    get "/electric_kettle_path" => "products#electric_kettle"

    get "/any_product" => "products#individual"

    get "/any_product/:any_product" => "products#individual"
  end
end
