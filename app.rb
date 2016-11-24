require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base
  attr_reader :player1, :player2

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    $player1 = params[:player1]
    $player2 = params[:player2]
    redirect to('/play')
  end

  get '/play' do
    $player1
    $player2
    erb(:play)
  end

   get '/attack' do
   erb(:attack)
   end


  run! if app_file == $0

end
