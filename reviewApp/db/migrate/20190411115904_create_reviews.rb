class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reviewAuthor
      t.integer :prodRating
      t.text :prodReview
      t.date :reviewDate
      t.date :datePosted

      t.timestamps
    end
  end
end
