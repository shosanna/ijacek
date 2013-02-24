class Person < ActiveRecord::Base
  has_secure_password
  attr_accessible :gender, :info, :password_hash, :password_salt, :username
  has_many :entries

  def image_or_default
    image || "default.png"
  end

end
