require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  attr_reader :player1, :player2

  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(params[:player1], params[:player2])
    redirect to('/play')
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
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
    @player = @game.player2
    erb(:loose)
  end

  run! if app_file == $0

end
