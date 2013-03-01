class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :person_id
      t.string :description
      t.string :location
      t.string :name

      t.timestamps
    end
  end
end
