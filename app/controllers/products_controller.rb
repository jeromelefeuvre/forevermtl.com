class ProductsController < HomeController
  add_breadcrumb "Acceuil", :root_path
  add_breadcrumb "Les produits", :products_path

  def index
    @products = if params[:product_category_id]
      add_breadcrumb(
        ProductCategory.find(params[:product_category_id]).title,
        product_category_products_path(params[:product_category_id])
      )

      ProductCategory.where(id: params[:product_category_id]).try(:first).try(:products)
    else
      add_breadcrumb(
        'Coup de coeur'
      )

      Product.star
    end

    @products = @products ? @products.active : []
  end

  def show
    @product = Product.find_by(id: params[:id], product_category_id: params[:product_category_id]) || not_found

    add_breadcrumb(
      @product.product_category.title,
      product_category_products_path(@product.product_category)
    )
    add_breadcrumb(
      @product.title,
      [@product.product_category, @product]
    )
  end

end
