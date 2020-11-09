class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.order(id: :asc)

    if params[:search]
      @products = @products.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:sort] == "price"
      @products = @products.order(price: :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(price: :desc)
    end

    if params[:discount] == "true"
      @products = @products.where("price < 100")
    end
    render "index.json.jb"
  end

  def show
    input_id = params["show"]
    @product = Product.find_by(id: input_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new ({
      name: params[:name],
      price: params[:price],
      description: params[:description],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id],
    })
    if @product.save
      image = Image.create!({ product_id: @product.id, url: params[:url] })
      render "show.json.jb"
    else
      render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    input_id = params["id"]
    @product = Product.find_by(id: input_id)
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.quantity = params["quantity"] || @product.quantity
    @product.supplier_id = params["supplier_id"] || @product.supplier_id

    if @product.save
      render "show.json.jb"
    else
      render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    input_id = params["id"]
    @product = Product.find_by(id: input_id)
    @product.destroy
    render json: { message: "It's gone!" }
  end
end
