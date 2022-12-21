class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :matchups
    has_many :games, through: :matchups
end