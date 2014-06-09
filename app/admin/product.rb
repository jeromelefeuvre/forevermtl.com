ActiveAdmin.register Product do
  permit_params :title, :description, :price, :product_category_id, :image, :active

  index do
    selectable_column
    column :title
    column :price do |product|
      number_to_currency product.price, locale: :'fr-CA'
    end
    bool_column :active
    column :product_category do |product|
      link_to product.product_category.title, admin_product_category_path(product.product_category)
    end
    actions
  end

  show do
    attributes_table do
      row :product_category do
        link_to product.product_category.title, admin_product_category_path(product.product_category)
      end
      row :title
      bool_row :active
      row :updated_at

      row :image do
        image_tag product.image.url
      end
    end
  end

end
