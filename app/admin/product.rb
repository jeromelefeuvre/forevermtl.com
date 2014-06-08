ActiveAdmin.register Product do
  permit_params :title, :description, :price, :product_category_id

  index do
    selectable_column
    column :product_category
    column :title
    column :price do |product|
      number_to_currency product.price, locale: :'fr-CA'
    end
    column :updated_at
    actions
  end

end
