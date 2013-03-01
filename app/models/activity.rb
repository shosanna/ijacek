class Activity < ActiveRecord::Base
  attr_accessible :description, :location, :person_id, :name
  belongs_to :person


end
