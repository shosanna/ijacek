class Entry < ActiveRecord::Base
  attr_accessible :text, :author
  belongs_to :person
  has_many :comments
  scope :recent, order("created_at DESC").limit(5)
end