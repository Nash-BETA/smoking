class Store < ApplicationRecord
    has_many :reviews
    has_many :favorite
    has_many :users, through: :favorites
end
