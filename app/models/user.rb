class User < ActiveRecord::Base
    has_many :matchups
    has_many :games, through: :matchups

    def userauthenticity
        user = User.find_for_authentication(email: params[:user][:email])
        User.valid_password?(params[:user][:password])
    end
end