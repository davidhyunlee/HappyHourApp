class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.string :caption
      t.references :user, index: true, foreign_key: true
      t.references :business, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
