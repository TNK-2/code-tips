class Tip < ApplicationRecord
    has_many :passive_relationships, class_name:  "Relationship",
                                     foreign_key: "favourite_tip_id",
                                     dependent:   :destroy

    has_many :favouritter, through: :passive_relationships, source: :favouritter

    belongs_to :category
    belongs_to :user

    validates :title        ,presence: true
    validates :category_id  ,presence: true
    validates :contents     ,presence: true ,length: { maximum: 1000 }
end
