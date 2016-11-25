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
    @game = Game.start_game(params[:player1], params[:player2])
    redirect to('/play')
  end

  get '/play' do
    @game = Game.play
    erb(:play)
  end

  get '/attack' do
    @game = Game.play
    if @game.turn
      @player = @game.player2
      @game.attack(@game.player2)
    else
      @player = @game.player1
      @game.attack(@game.player1)
    end
    @game.switch_player
    redirect to ('/loose') if @game.player2.dead? || @game.player1.dead?
    erb(:attack)
  end

  get '/loose' do
    @game = Game.play
    @player = @game.player2
    erb(:loose)
  end

  run! if app_file == $0

end
