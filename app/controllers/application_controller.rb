class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/mygames/:id" do
    games = User.find(params[:id]).games
    games.to_json
  end

  get '/allgames' do
    games = Game.all
    games.to_json
  end

  get '/mygames' do
    mygames = Game.all.select do |game|
      game.users.include?(User.find(params[:user_id]))
        mygames.to_json
    end
  end

  get "/games/:id" do
    game = Games.find(params[:id])
    game.to_json
  end

  get "/matchups/:id" do
    matchups = User.find(params[:id]).matchups
    matchups.to_json
  end

  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end

  get "/users" do
    users = User.all
    users.to_json
  end

  post "/users" do
    user = User.create(params)
    user.to_json
  end

end
