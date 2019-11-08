class Store < ApplicationRecord
    has_many :reviews

    #お気にり入りで追加
    has_many :favorites, foreign_key: 'store_id', dependent: :destroy
    has_many :users, through: :favorites



end
