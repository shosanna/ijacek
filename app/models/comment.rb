class Comment < ActiveRecord::Base
  belongs_to :person
  belongs_to :commentable, polymorphic: true
  attr_accessible :text, :person_id, :commentable_id, :commentable_type

  validates_presence_of :text, :person_id, :commentable_id, :commentable_type
end
