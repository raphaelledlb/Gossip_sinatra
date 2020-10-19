require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
#définit les propriétés de la page gossips/new
  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end


  get '/gossips/new/' do
    erb :new_gossip
  end

#définit les propriétés de la page gossips/id, l'id correspondant au numéro du gossip.
  get '/gossips/:id/' do
    erb :show, locals: {gossip: Gossip.find(params["id"].to_i)}

  end
end