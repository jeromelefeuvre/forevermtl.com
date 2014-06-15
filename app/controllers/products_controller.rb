class ProductsController < ApplicationController
  def index
    @products = ProductCategory.find(params[:product_category_id]).try('products')

    @products = ProductCategory.first.try(:products) if @products.nil?

    @product_categories = ProductCategory.only_with_products
    @products = @products ? @products.active : []
  end
end
