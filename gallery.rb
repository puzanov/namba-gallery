require "rubygems"
require "bundler/setup"
require "sinatra"
require "json"
require "open-uri"

set :environment, :production
set :server, %w[thin]

get '/:page' do |page|
  content_type :json
  @main = true
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=category_albums&category=super&page=1&sort=desc&page=#{page}").read)
  @photos['albums'].to_json
end

get '/' do
  @main = true
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=category_albums&category=super&page=1&sort=desc").read)
  erb :photos
end

get '/album/:id/:page' do |id, page|
  content_type :json
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=elements_list&type=album&limit=25&param=#{id}&page=#{page}").read)
  @photos['elements'].to_json
end

get '/album/:id/?' do |id|
  @main = false
  @id = id
  @photos = JSON.parse(open("http://namba.kg/api/?service=photo&action=elements_list&type=album&limit=25&param=#{id}").read)
  erb :photos
end
