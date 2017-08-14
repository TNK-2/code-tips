class Tip < ApplicationRecord
    include SessionHelper
    
    has_many :passive_relationships, class_name:  "Relationship",
                                     foreign_key: "favourite_tip_id",
                                     dependent:   :destroy

    has_many :favouritter, through: :passive_relationships, source: :favouritter
    has_many :comments, dependent: :destroy

    belongs_to :category
    belongs_to :user

    validates :title        ,presence: true
    validates :category_id  ,presence: true
    validates :contents     ,presence: true ,length: { maximum: 1500 }

    def writer?(user_id)
        user.id == user_id
    end
end
