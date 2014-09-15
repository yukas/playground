regex = /No+/
string = "Noooo"

# raise regex.match(string).inspect

regex = /\A\w/
string = "hello"

puts string.gsub(regex) { |match| match.upcase }