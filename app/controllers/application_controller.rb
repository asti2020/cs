class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/mygames" do
    user = User.find(params[:user_id])
    user.games.to_json
  end

end
