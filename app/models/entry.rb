class Entry < ActiveRecord::Base
  attr_accessible :text, :author
  belongs_to :person
end