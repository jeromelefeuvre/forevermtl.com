class AddStarToProduct < ActiveRecord::Migration
  def change
    add_column :products, :star, :boolean
  end
end