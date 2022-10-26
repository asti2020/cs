
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

  get "/allgames/:id" do
    game = allgames.find(params[:id])
    game.to_json
  end

  patch "/allgames/:id" do
    game = Game.find(params[:id])
    game.update(position: params[:position])
    game.to_json
  end

  get "/users" do
    users = User.all
    users.to_json
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

  delete "/allgames/:id" do
    game = Game.find(params[:id])
    game.destroy
    game.to_json
  end

  post "/matchups" do
    matchup = Matchup.create(user_id: params[:user_id], game_id: params[:game_id], side: params[:side])
    matchup.to_json
  end

#    post '/login' do
#     user = User.find_by(email: params[:email])
#     if user && user.authenticate(params[:password])
#         user.to_json
#     else
#         {error: "Invalid username or password"}.to_json
#     end
# end

  post '/login' do
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
          user.to_json
      else
          {error: "Invalid username or password"}.to_json
      end
  end

end
# class ApplicationController < Sinatra::Base
#   set :default_content_type, 'application/json'
  
#   # Add your routes here
#   get "/mygames/:id" do
#     games = User.find(params[:id]).games
#     games.to_json
#   end

#   get '/allgames' do
#     games = Game.all
#     games.to_json
#   end

#   get '/mygames' do
#     mygames = Game.all.select do |game|
#       game.users.include?(User.find(params[:user_id]))
#         mygames.to_json
#     end
#   end

#   get "/games/:id" do
#     game = Games.find(params[:id])
#     game.to_json
#   end

#   get "/matchups/:id" do
#     matchups = User.find(params[:id]).matchups
#     matchups.to_json
#   end

#   get "/users/:id" do
#     user = User.find(params[:id])
#     user.to_json
#   end

#   get "/users" do
#     users = User.all
#     users.to_json
#   end

#   post "/users" do
#     user = User.create(params)
#     user.to_json
#   end

# end
