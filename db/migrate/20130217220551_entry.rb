class Entry < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :text
      t.string :author
      t.timestamps
    end
  end

end
