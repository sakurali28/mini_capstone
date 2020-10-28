class Api::ProductsController < ApplicationController
  def products_action
    @product = Product.all
    render "products.json.jb"
  end
end
