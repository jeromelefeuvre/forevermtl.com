class AddTranslationsToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :title_translations, :hstore
  end
end
