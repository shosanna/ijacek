class AddTimeToPeople < ActiveRecord::Migration
  def up
    add_column :people, :time, :string
  end

  def down
    remove_column :people, :time, :string

  end
end
