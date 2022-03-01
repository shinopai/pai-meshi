require 'httparty'

response = HTTParty.get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
puts response.body if response.code == 200
