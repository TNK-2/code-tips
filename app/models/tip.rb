class Tip < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :title        ,presence: true
    validates :category_id  ,presence: true
    validates :contents     ,presence: true ,length: { maximum: 1000 }
end
