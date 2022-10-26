class Game < ActiveRecord::Base
    has_many :matchups
    has_many :users, through: :matchups

    def opponent(user_id)
        users.map do |user|
            if user.id != user_id
                return user.username
            end
        end
    end

end