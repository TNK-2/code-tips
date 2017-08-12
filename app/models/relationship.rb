class Relationship < ApplicationRecord
    belongs_to :favourite_tip, class_name: "Tip"
    belongs_to :favouritter,   class_name: "User"
    validates :favourite_tip_id, presence: true
    validates :favouritter,      presence: true
end
