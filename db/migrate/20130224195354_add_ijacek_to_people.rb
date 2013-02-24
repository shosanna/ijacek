class AddIjacekToPeople < ActiveRecord::Migration
  def change
    add_column :people, :ijacek, :boolean
  end
end
