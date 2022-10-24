class User < ActiveRecord::Base
    has_many :matchups
    has_many :games, through: :matchups
end