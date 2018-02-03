class AddDetailToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :marka, foreign_key: true
  end
end
