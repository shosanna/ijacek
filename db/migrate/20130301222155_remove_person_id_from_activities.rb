class RemovePersonIdFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :person_id
    add_column :activities, :activity_person_id, :string
  end

  def down
    add_column :activities, :person_id, :integer
    remove_column :activities, :activity_person_id
  end
end
