require 'open-uri'

# kittens = open('http://placekitten.com/')
# response_status = kittens.status
# response_body = kittens.read[559, 441]
#
# puts response_status
# puts response_body

nyt_response_status = nyt_call.status
nyt_response_body = nyt_call.read

puts nyt_response_status
puts nyt_response_body
