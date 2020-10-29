class Api::ProductsController < ApplicationController
  def products_action
    @products = Product.all
    render "products.json.jb"
  end

  def blender
    @product = Product.first
    render "blender.json.jb"
  end

  def dutch_oven
    @product2 = Product.find_by(id: 2)
    render "dutch_oven.json.jb"
  end

  def electric_kettle
    @product3 = Product.find_by(id: 3)
    render "electric_kettle.json.jb"
  end
end
