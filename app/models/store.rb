class Store < ApplicationRecord
    has_many :reviews
    has_many :favorite
end
