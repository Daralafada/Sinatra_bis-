require_relative 'gossip'

class ApplicationController < Sinatra::Base
 
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do 
    #id = numéro du potin 
    "Voici le numéro du potin que tu veux : #{params['id']}"
    Gossip.find(params['id'])
    erb :show, locals: {gossip_find: Gossip.find(params['id']), number_gossip: params['id']}
  end 

  post 'gossips/:id/edit/' do 
    Gossip.update(params["gossip_author"], params["gossip_content"]).save
    erb :edit, locals: {number_gossip: params['id']}
  end 

  #post '/gossips/new/' do
  #  puts "Salut, je suis dans le serveur"
  #  puts "Ceci est le contenu du hash params : #{params}"
  #  puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  #  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  #  puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  #end

end