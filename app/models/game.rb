class Game < ActiveRecord::Base
    has_many :matchups
    has_many :users, through: :matchups
end