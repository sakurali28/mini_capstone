class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    input_id = params["show"]
    @supplier = Supplier.find_by(id: input_id)
    render "show.json.jb"
  end

  def create
    @supplier = Supplier.new ({
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
    })
    @supplier.save
    render "show.json.jb"
  end

  def update
    @supplier = Supplier.find_by(id: input_id)
    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number

    @supplier.save
    render "show.json.jb"
  end

  def destroy
    input_id = params["id"]
    @supplier = Supplier.find_by(id: input_id)
    @supplier.destroy
    render json: { message: "it's gone!" }
  end
end
