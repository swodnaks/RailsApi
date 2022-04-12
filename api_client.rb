require 'faraday'
require 'oj'



client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('d8f824cbc7e02f7536def762e4c02ef0')
end

response = client.post do |r|
  r.url '/api/v1/posts'
  r.headers['Content-Type'] = 'application/json'
  r.body = '{ "post": {"title": "Hello", "body": "Hey"} }'
end

puts Oj.load(response.body)
puts response.status
