class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one_attached :avatar, dependent: :destroy

    validates :name, presence: :true
    validates :email, format: {with: /@/, message: "must have an @" }, presence: :true, uniqueness: true
    validates :username, presence: :true, uniqueness: true
    
    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user.username = "user_name"
        user
    end
    
    def has_password?
        self.password_digest.nil? || self.password_digest != '0'
    end

end
