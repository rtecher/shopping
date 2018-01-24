class CreateSepets < ActiveRecord::Migration[5.1]
  def change
    create_table :sepets do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
