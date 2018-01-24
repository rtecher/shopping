class AddDetailsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :trademark, :string
    add_column :products, :price, :integer
    add_column :products, :discount, :integer
    add_column :products, :category, :string
  end
end
