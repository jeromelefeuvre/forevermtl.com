class RemoveFieldsToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :title, :string
    remove_column :products, :description, :text

    remove_column :product_categories, :title, :string
  end
end
