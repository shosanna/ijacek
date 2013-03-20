class Activity < ActiveRecord::Base
  attr_accessible :description, :location, :activity_person_id, :name
  belongs_to :person
  serialize :activity_person_id
  has_many :comments, as: :commentable
  has_many :photos

  before_save do
    self.activity_person_id = [] unless self.activity_person_id
  end

  scope :recent, order("created_at DESC").limit(5)
end
