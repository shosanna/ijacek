class Person < ActiveRecord::Base
  has_secure_password
  attr_accessible :gender, :info, :password_hash, :password_salt, :username
  has_many :entries, :dependent => :destroy
  has_many :activities

  def self.schedule
    ["Tyna", "Tom", "Simonka", "Kuba", "Pavel"]
  end

  def self.current
    current_person = Person.where(:ijacek => true).first || Person.first
    current_person.ijacek = true
    current_person.save
    return current_person
  end

  def self.next
    # zjistim na jake pozici v poli je current
    if current
      position = schedule.index(current.username)
      new_position = (position + 1) % schedule.length
      name = schedule[new_position]
      return Person.find_by_username(name)
    else
      first = schedule[0]
      first_person = Person.find_by_username(first)
    end
  end

  def self.change_next
    current = self.current
    if current
      position = schedule.index(current.username) || 0

      # current nastavim na false
      current.ijacek = false
      current.save
      # ten dalsi po current se nastavi na true
      new_position = (position + 1) % schedule.length
      name = schedule[new_position]
      next_person = Person.find_by_username(name)
      next_person.ijacek = true
      next_person.save
    else
      first = schedule[0]
      first_person = Person.find_by_username(first)
      first_person.ijacek = true
      first_person.save
    end

    # Nastavim datum kdy se zavolala tahle funkce = odky je ijacek u cloveka, plus 14 dni je datum kdy je dalsi vymena
    i = Time.now.strftime("%m/%d/%Y")
    current.time = i.to_s
    t = Time.now + (2*7*24*60*60)
    t = t.strftime("%m/%d/%Y")
    current.time_exchange = t.to_s
    current.save
  end

  def image_or_default
    image || "default.png"
  end

end
