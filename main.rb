require 'sinatra'
# require 'sinatra/reloader'
require "pg"
require_relative "models/cube"


get '/' do
  
  erb :index;

end

get '/cube' do

  cubes = find_all_cubes

  cube = cubes.first


  erb :cube, locals: { cube: cube }

end

post '/cube' do

  create_cube(params["front"], params["side"], params["top"])

  redirect "/cube"

end

delete '/cube' do

  delete_cube(params["id"])

  redirect "/"

end