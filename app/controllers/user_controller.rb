class UserController < ApplicationController
    get '/user' do
        if logged_in?
            @user = current_user
        else
            redirect to '/login'
        end
    end

    get '/signup' do
        if logged_in?
            redirect to '/user'
        end
    end

    post '/signup' do
        if params[:username].empty? || params[:email].empty? || params[:password].empty? || params[:password_confirmation].empty?
            flash[:message] = "Please fill in all fields."
            redirect to '/signup'
            else
                @user = User.create(username: params[:username], email: params[:email], password: params[:password])
                session[:user_id] = @user.id
                flash[:message] = "You have successfully signed up."
                redirect to '/user'
        end
    end
end