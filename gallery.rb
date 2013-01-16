require "rubygems"
require "bundler/setup"
require "sinatra"
require "json"
require "open-uri"

get '/favicon.ico' do
  '1'
end

get '/:id' do |id|
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=elements_list&type=album&limit=15&param=#{id}").read)
  erb :photos
end

get '/' do
  'Main page'
end