class ProductsController < ApplicationController
  def index
    @products = ProductCategory.where(name: params[:name]).try('products')

    # if @products.nil?
    #   @products = ProductCategory.first.products.active
    # end

    @products.active
  end
end
