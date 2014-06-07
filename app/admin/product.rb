ActiveAdmin.register Product do
  permit_params :title, :description, :price

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :created_at
    actions
  end
end
