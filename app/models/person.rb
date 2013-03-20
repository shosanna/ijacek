class Person < ActiveRecord::Base
  has_secure_password
  attr_protected :gender, :info, :password_hash, :password_salt, :username, :ijacek
  has_many :entries, :dependent => :destroy
  has_many :activities
  has_many :comments
  has_many :answers
  has_many :questions, through: :answers

  def self.schedule
    %w(Tyna Tom Simonka Kuba Pavel)
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
    name = nil

    if current
      position = schedule.index(current.username) || 0

      # current nastavim na false
      current.ijacek = false
      current.save

      # ten dalsi po current se nastavi na true
      new_position = (position + 1) % schedule.length
      name = schedule[new_position]
    else
      name = schedule[0]
    end

    new_person = Person.find_by_username(name)
    # Nastavim datum kdy se zavolala tahle funkce = odky je ijacek u cloveka, plus 14 dni je datum kdy je dalsi vymena
    new_person.ijacek = true
    new_person.exchange_at = Time.now
    new_person.save
  end

  def image_or_default
    image || "default.png"
  end

end
