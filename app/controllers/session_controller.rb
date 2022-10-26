class SessionsController < ApplicationController 
    get '/login' do
        if logged_in?
            redirect to '/user'
        end
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            # redirect to '/user'
            render json: user
        elsif params[:email].empty? || params[:password].empty?
            "Cont be empty, Please fill in all fields."
        else
            redirect to '/login'
        end
    end

    delete '/logout' do
        session.clear
        redirect to '/login'
    end
end