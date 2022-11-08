class User < ApplicationRecord
    has_secure_password
    validates :name, presence: :true
    validates :email, format: {with: /@/, message: "must have an @" }, presence: :true, uniqueness: true
    validates :username, presence: :true, uniqueness: true
    
    has_many :posts
    has_many :comments
end
