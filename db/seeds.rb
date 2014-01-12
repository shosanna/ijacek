Person.destroy_all

%w(Kuba Simonka Pavel Martina Arnie Joc Tom Tyna).each do |user|
  a = Person.new
  a.username = user
  a.password = "heslo"
  a.exchange_at = Time.now
  a.save
end

a = Person.find_by_username("Tyna")
a.gender = 0
a.save

a = Person.find_by_username("Simonka")
a.gender = 0
a.save

a = Person.find_by_username("Martina")
a.gender = 0
a.save

a = Person.find_by_username("Joc")
a.gender = 0
a.save

a = Person.find_by_username("Kuba")
a.gender = 1
a.save

a = Person.find_by_username("Pavel")
a.gender = 1
a.save

a = Person.find_by_username("Tom")
a.gender = 1
a.save

a = Person.find_by_username("Arnie")
a.gender = 1
a.ijacek = true
a.save
