class Photo < ActiveRecord::Base
  attr_accessible :photo, :activity_id
  belongs_to :activity
  mount_uploader :photo, PhotosUploader
end
