class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :fullName
      t.date :dob
      t.text :address
      t.string :city
      t.string :country
      t.string :userPhoto

      t.timestamps
    end
  end
end
