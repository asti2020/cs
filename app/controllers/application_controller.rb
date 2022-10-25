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

  get "/" do
    games = Game.all
    games.to_json
  end

  get '/matchup' do
    projects = Game.all
    projects.to_json(include: [:users, :matchups])
  end


  # get "/log" do
  # #  if User.valid_password?(params[:user][:password])
  # #   user = User.find_for_authentication(email: params[:user][:email])
  # #   user.to_json
  # #  else
  # #   {message: "Invalid email or password"}.to_json
  # #  end
  #   # users = User.find_for_authentication(email: params[:user][:email])
  #   # User.valid_password?(params[:user][:password])
  #   # users.to_json
  # end
  # get "/log" do
  #   users = User.where(user_id: new.id)
  #   users.to_json(include: [:games, :matchups])
  # end


  post "/users" do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    user.to_json
  end


  patch "/users/:id" do
    users = User.find(params[:id])
    users.update(username: params[:username], email: params[:email], password: params[:password])
    users.to_json
  end

  delete "/users/:id" do
    users = User.find(params[:id])
    users.destroy
    users.to_json
  end

end
