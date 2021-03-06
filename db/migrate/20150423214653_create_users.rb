class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location
      t.string :hometown
      t.string :nickname
      t.string :headline
      t.string :website
      t.string :password_digest
      t.string :photo

      t.timestamps null: false
    end
  end
end
