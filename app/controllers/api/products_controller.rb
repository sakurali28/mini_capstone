class Api::ProductsController < ApplicationController
  def products_action
    @products = Product.all
    render "products.json.jb"
  end

  def blender
    @product1 = Product.first
    render "blender.json.jb"
  end

  def dutch_oven
    render "dutch_oven.json.jb"
  end
end
