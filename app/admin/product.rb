ActiveAdmin.register Product do
  permit_params :code, :price, :product_category_id, :active, :star,
                :title, :title_en, :title_fr, :description_en, :description_fr,
                :image, :remote_image_url

  scope :active
  scope :star

  config.filters = false

  sidebar 'Product Categories' do
    table_for ProductCategory.order("product_categories.title_translations -> 'fr'") do |t|
      t.column("Title") { |product_category| link_to product_category.title, admin_product_category_products_path(product_category) }
    end
  end

  controller do
    def scoped_collection
      collection = super.includes(:product_category)

      return collection if params[:product_category_id].blank?

      collection.where(product_category_id: params[:product_category_id])
    end

    def active
      @product = Product.find(params[:id])

      @product.update(active: !@product.active)
      render json: @product.active
    end

    def star
      @product = Product.find(params[:id])

      @product.update(star: !@product.star)
      render json: @product.star
    end
  end

  index do
    selectable_column
    bool_column :active
    column(:star){ |product| display_rating(product.star?) }
    column :code
    column :title, :sortable => false
    column :price, :sortable => :price do |product|
      number_to_currency product.price, unit: '$ CAD'
    end
    unless params[:product_category_id]
      column :product_category do |product|
        link_to(
          product.product_category.title_fr,
          admin_product_category_path(product.product_category)
        ) if product.product_category
      end
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

      row(:star) { |product| display_rating(product.star?) }
      bool_row :active

      row :code
      I18n.available_locales.each do |locale|
        row ('title_%s' % locale).to_sym
      end

      row :price do
        number_to_currency product.price, unit: '$ CAD'
      end

      I18n.available_locales.each do |locale|
        row ('description_%s' % locale).to_sym do
          product.send(('description_%s' % locale).to_sym).try(:html_safe)
        end
      end

      row :image do
        image_tag product.image.small.url
      end

      row :updated_at
    end
  end

  form do |f|
    f.actions

    f.inputs 'Details' do
      f.input :active
      f.input :star
      f.input :code
      I18n.available_locales.each do |locale, value|
        f.input ('title_%s' % locale).to_sym
      end
      f.input :product_category

      f.input :price
      f.input :cc
    end

    f.inputs "Image" do
      f.input :image, :as => :file
      f.input :remote_image_url, :hint => f.template.image_tag(f.object.image.small.url)
    end

    f.inputs 'Content' do
      I18n.available_locales.each do |locale, value|
        f.input ('description_%s' % locale).to_sym, :as => :ckeditor, :input_html => { :ckeditor => { :height => 100 } }
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
