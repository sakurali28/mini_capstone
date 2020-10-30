class Api::ProductsController < ApplicationController
  def products_action
    @products = Product.all
    render "products.json.jb"
  end

  def blender
    @product = Product.find_by(id: 1)
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

  def individual
    input = params["any_product"]
    @output = Product.find_by(id: input)
    render "individual.json.jb"
  end
end
