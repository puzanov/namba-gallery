require "rubygems"
require "bundler/setup"
require "sinatra"
require "json"
require "open-uri"

get '/favicon.ico' do
  '1'
end

get '/:id/:page' do |id, page|
  content_type :json
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=elements_list&type=album&limit=25&param=#{id}&page=#{page}").read)
  @photos['elements'].to_json
end

get '/:id' do |id|
  @id = id
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=elements_list&type=album&limit=25&param=#{id}").read)
  erb :photos
end

get '/' do
  'Main page'
end