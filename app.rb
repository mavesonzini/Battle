require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  attr_reader :player1, :player2

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player1]),Player.new(params[:player2]))
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    if @game.turn
      @player = @game.player2
      @game.attack(@game.player2)
    else
      @player = @game.player1
      @game.attack(@game.player1)
    end
    @game.switch_player
    erb(:attack)
  end


  run! if app_file == $0

end
