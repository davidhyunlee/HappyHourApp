class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :location
      t.string :hometown
      t.string :nickname
      t.string :headline
      t.string :website
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
