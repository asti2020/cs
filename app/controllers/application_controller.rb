class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
    
  get "/mygames/:id" do
    games = User.find(params[:id]).games
    games.to_json
  end

  get "/allgames/:id" do
    game = Game.find(params[:id])
    game.to_json
  end

  patch "/allgames/:id" do
    game = Game.find(params[:id])
    game.update(position: params[:position])
    game.to_json
  end

  get "/users/:email/:password" do
    user = User.find_by(email: params[:email], password: params[:password])
    user.to_json
  end

  get "/games/:userId" do
    games = User.find(params[:userId]).games
    games.to_json
  end

  post "/users" do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    user.to_json
  end

  get "/side/:id/:player" do
    matchup = Matchup.find_by(game_id: params[:id], user_id: params[:player])
    matchup.to_json
  end

  post "/allgames" do
    game = Game.create(position: params[:position])
    game.to_json
  end

  post "/matchups" do
    matchup = Matchup.create(user_id: params[:user_id], game_id: params[:game_id], side: params[:side])
    matchup.to_json
  end

  get "/users/:username" do
    user_id = User.find_by(username: params[:username]).id
    user_id.to_json
  end

  # post '/login' do
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #       user.to_json
  #   else
  #       {error: "Invalid username or password"}.to_json
  #   end
  # end

end
