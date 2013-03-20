class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :person
      t.references :entry
      t.text :text
      t.timestamps
    end
    add_index :comments, :person_id
    add_index :comments, :entry_id
  end
end
