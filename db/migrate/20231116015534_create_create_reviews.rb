class CreateCreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :create_reviews do |t|
      t.string :comment
      t.integer :rating
      t.references  null: false, foreign_key: true

      t.timestamps
    end
  end
end
