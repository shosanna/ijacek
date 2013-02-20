class AddPersonIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :person_id, :integer
  end
end
