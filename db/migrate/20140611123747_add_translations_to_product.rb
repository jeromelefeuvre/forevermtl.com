class AddTranslationsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :title_translations, :hstore
    add_column :products, :description_translations, :hstore
  end
end