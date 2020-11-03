class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    input_id = params["show"]
    @product = Product.find_by(id: input_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new ({
      id: @product["id"]
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    })
    @product.save
    render "show.json.jb"
  end

  def update
    input_id = params["id"]
    @product = Product.find_by(id: input_id)
    @product.id = params["id"]  || @product.id
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description

    @product.save
    render "show.json.jb"
  end

  def destroy
    input_id = params["id"]
    @product = Product.find_by(id: input_id)
    @product.destroy
    render json: { message: "It's gone!" }
  end
end
