class CreateMarkas < ActiveRecord::Migration[5.1]
  def change
    create_table :markas do |t|
      t.string :name

      t.timestamps
    end
  end
end
