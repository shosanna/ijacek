class ThirdTry < ActiveRecord::Migration
  def change
    add_column :people, :password_digest, :string
    remove_column :people, :password_salt
    remove_column :people, :password_hash
  end
end
