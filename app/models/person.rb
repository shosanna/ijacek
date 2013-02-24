class Person < ActiveRecord::Base
  has_secure_password
  attr_accessible :gender, :info, :password_hash, :password_salt, :username
  has_many :entries

  def shedule
    ["Tyna", "Tomas", "Simona", "Kuba", "Pavel"]
  end

  def current
    Person.where(:ijacek => true).first
  end

  def next
    # zjistim na jake pozici v poli je current
    position = schedule.index(current)
    # current nastavim na false
    current.ijacek = false
    current.save
    # ten dalsi po current se nastavi na true
    new_position = position + 1
    name = schedule[new_position]
    next_person = Person.find_by_username("name")
    next_person.ijacek = true
    next_person.save
    # vratim toho dalsiho
    return next_person
  end

  def image_or_default
    image || "default.png"
  end

end
