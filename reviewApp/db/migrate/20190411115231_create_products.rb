class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :prodName
      t.string :brand
      t.float :avgCost
      t.string :category
      t.date :relDate
      t.text :description
      t.string :prodPhoto

      t.timestamps
    end
  end
end
