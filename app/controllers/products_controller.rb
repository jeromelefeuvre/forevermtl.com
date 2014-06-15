class ProductsController < ApplicationController
  def index
    @products = ProductCategory.where(id: params[:product_category_id]).try(:first).try(:products)

    @products = Product.star if @products.blank?

    @product_categories = ProductCategory.only_with_products
    @products = @products ? @products.active : []
  end
end
