class ProductsController < ApplicationController
  before_filter :set_product_categories

  def index
    @products = ProductCategory.where(id: params[:product_category_id]).try(:first).try(:products)

    @products = Product.star if @products.blank?

    @products = @products ? @products.active : []
  end

  def show
    @product = Product.find_by(id: params[:id], product_category_id: params[:product_category_id]) || not_found
  end

  private
  def set_product_categories
    @product_categories = ProductCategory.only_with_products
  end
end
