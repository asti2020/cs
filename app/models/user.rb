class User < ActiveRecord::Base
    has_many :matchups
    has_many :games, through: :matchups

    has_secure_password
    validates :email, presence: true, uniqueness: true
end