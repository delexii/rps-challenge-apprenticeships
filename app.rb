require "sinatra/base"
require "sinatra/reloader"
require "./lib/player"
require "./lib/game"

class RockPaperScissors < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get "/test" do
    "test page"
  end

  get "/" do
    erb :index
  end

  post "/name" do
    player1 = Player.new(params[:player1_name])
    @game = Game.create(player1)
    redirect "/play"
  end

  get "/play" do
    @game = Game.instance
    erb :play
  end

  run! if app_file == $0
end
