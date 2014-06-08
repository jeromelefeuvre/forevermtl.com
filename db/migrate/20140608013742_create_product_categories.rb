class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :title
      t.string :name

      t.timestamps
    end

    add_column :products, :product_category_id, :integer
  end
end