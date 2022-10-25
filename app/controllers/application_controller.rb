class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/mygames/:id" do
    games = User.find(params[:id]).games
    games.to_json
  end

  get "/games/:id" do
    game = Games.find(params[:id])
    game.to_json
  end

  get "/game" do
    games = Game.all
    games.to_json
  end


  # get "/user/:id" do
  #   users = User.find_for_authentication(email: params[:user][:email])
  #   User.valid_password?(params[:user][:password])

  #   users.to_json
  # end

  post "/users/:id" do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    user.to_json
  end

end
