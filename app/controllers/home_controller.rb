class HomeController < ApplicationController
  before_filter :set_product_categories

  private
  def set_product_categories
    @product_categories = ProductCategory.only_with_products
  end

end