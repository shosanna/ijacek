class Answer < ActiveRecord::Base
  attr_accessible :person_id, :question_id, :text
  belongs_to :person
  belongs_to :question

  validates_presence_of :question, :person, :text
end
