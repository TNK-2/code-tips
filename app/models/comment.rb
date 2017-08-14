class Comment < ApplicationRecord
    belongs_to :tip
    belongs_to :user
    validates :comment, presence: true, length: { maximum: 140 }

    def commenter?(user_id)
        user.id == user_id
    end

end
