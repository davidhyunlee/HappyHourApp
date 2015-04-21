class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body
      t.float :rating
      t.string :title

      t.timestamps null: false
    end
  end
end
