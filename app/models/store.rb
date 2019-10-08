class Store < ApplicationRecord
    has_many :reviews

    #お気にり入りで追加
    has_many :favorites
    has_many :users, through: :favorites


end
