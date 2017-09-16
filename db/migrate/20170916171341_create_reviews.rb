class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :rating
      t.references :artist, foreign_key: true
      t.references :user, foreign_key: true
      t.references :consumer_request, foreign_key: true

      t.timestamps
    end
  end
end
