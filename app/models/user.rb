class User < ApplicationRecord
    include SessionHelper
    has_many  :active_relationships, class_name:  "Relationship",
                                     foreign_key: "favouritter_id",
                                     dependent:   :destroy
    
    has_many  :favourite_tip, through: :active_relationships, source: :favourite_tip

    has_many  :tips
    validates :name, presence: true, length: { maximum: 20 }, uniqueness: true

    has_many  :comments, dependent: :destroy

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def favourite(favourite_tip)
        active_relationships.create(favourite_tip_id: favourite_tip.id, favouritter_id: id)
    end

    def unfavourite(favourite_tip)
        active_relationships.find_by(favourite_tip_id: favourite_tip.id, favouritter_id: id).destroy
    end

    def favourite?(tip)
        favourite_tip.include?(tip)
    end

end
