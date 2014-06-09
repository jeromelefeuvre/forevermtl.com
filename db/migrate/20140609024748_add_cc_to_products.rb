class AddCcToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cc, :decimal
  end
end
