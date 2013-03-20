class Comment < ActiveRecord::Base
  belongs_to :person
  belongs_to :entry
  attr_accessible :text, :person_id, :entry_id
end
