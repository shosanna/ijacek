class ChangeDescriptionInActivities < ActiveRecord::Migration
  def change
    change_column :activities, :description, :text, limit: nil
  end
end