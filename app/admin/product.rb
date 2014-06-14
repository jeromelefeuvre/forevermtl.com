ActiveAdmin.register Product do
  permit_params :code, :price, :product_category_id, :image, :active, :title, :title_en, :title_fr, :description_en, :description_fr

  index do
    selectable_column
    column :title
    column :price do |product|
      number_to_currency product.price, unit: '$ CAD'
    end
    bool_column :active
    column :product_category do |product|
      link_to(
        product.product_category.title_fr,
        admin_product_category_path(product.product_category)
      ) if product.product_category
    end
    actions
  end

  show do
    attributes_table do
      row :product_category do
        if product.product_category
          link_to product.product_category.title, admin_product_category_path(product.product_category)
        end
      end
      I18n.available_locales.each do |locale|
        row ('title_%s' % locale).to_sym
      end

      row :price do
        number_to_currency product.price, unit: '$ CAD'
      end
      bool_row :active

      I18n.available_locales.each do |locale|
        row ('description_%s' % locale).to_sym
      end

      row :image do
        image_tag product.image.small.url
      end

      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :code
      I18n.available_locales.each do |locale, value|
        f.input ('title_%s' % locale).to_sym
      end
      f.input :product_category
      f.input :active
      f.input :image
      f.input :price
      f.input :cc
    end

    f.inputs 'Content' do
      I18n.available_locales.each do |locale, value|
        f.input ('description_%s' % locale).to_sym, :as => :text, input_html: {rows: 4}
      end
    end

    f.actions
  end

  active_admin_importable do |model, hash|
      next unless Product.where(code: hash[:code]).count.zero?

      product_category = ProductCategory.with_title_translation(hash[:'product_category__title_fr'], :fr).try(:first)
      unless product_category
        product_category = ProductCategory.create(
          title_fr: hash[:'product_category__title_fr'],
          title_en: hash[:'product_category__title_en']
        )
      end

      hash[:product_category_id] = product_category.id
      hash.delete(:'product_category__title_fr')
      hash.delete(:'product_category__title_en')

      model.create!(hash)
   end
end
