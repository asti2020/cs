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

end
