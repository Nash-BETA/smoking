class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reviews

    #お気にり入りで追加
    has_many :stores
    has_many :favorites
    has_many :fav_posts, through: :favorites, source: :stores


    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:   true, length: { maximum: 255 }, format:     { with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password, length: { minimum: 6 }


    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end


    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end


    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    #お気に入り追加
    def like(store)
        Favorite.find_or_create_by(store_id: store.id)
    end

    #お気に入り削除
    def unlike(store)
        favorite = Favorite.find_by(store_id: store.id)
        favorite.destroy if favorite
    end


end