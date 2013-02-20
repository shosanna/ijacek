class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.integer :gender
      t.string :password_hash
      t.string :password_salt
      t.text :info

      t.timestamps
    end
  end
end
