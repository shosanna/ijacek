class Entry < ActiveRecord::Base
  attr_accessible :text, :author
  belongs_to :person
  has_many :comments, as: :commentable

  scope :recent, order("created_at DESC").limit(5)

  def commentable_text
    text.truncate(20)
  end
end
