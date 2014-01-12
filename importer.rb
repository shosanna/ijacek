require "net/http"
require "json"

uri = URI("http://localhost:3000/api/events.json")

req = Net::HTTP::Get.new(uri)
req.basic_auth "nuf", "muf"

res = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(req) }

events = JSON.parse(res.body)

File.open("events.txt", "w") do |file|
  events.each do |event|
    file.puts event["name"]
    file.puts event["created_at"]
    file.puts event["location"]
    file.puts event["description"]
    file.puts
  end 
end


