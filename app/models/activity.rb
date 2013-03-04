class Activity < ActiveRecord::Base
  attr_accessible :description, :location, :activity_person_id, :name
  belongs_to :person
  serialize :activity_person_id

  before_save do
    self.activity_person_id = [] unless self.activity_person_id
  end
end