require 'net/http'

url = URI.parse('https://api.github.com/repos/technoweenie/faraday')
data = Net::HTTP.get(url)

raise data.inspect