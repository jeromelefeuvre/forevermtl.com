ActiveAdmin.register ProductCategory do
  permit_params :title_en, :title_fr

  index do
    selectable_column
    column :title
    column :count
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
    end
    f.actions
  end

  form do |f|
    f.inputs 'Details' do
      f.object.title_translations.try(:each) do |locale, value|
        f.input ('title_%s' % locale).to_sym, :input_html => {:value => value }
      end
    end

    f.actions
  end


  sidebar 'Products by this Category', :only => :show do
    table_for Product.joins(:product_category).where(:product_category_id => product_category.id) do |t|
      t.column("Title") { |product| link_to product.title, admin_product_path(product.id) }
    end
  end
end
