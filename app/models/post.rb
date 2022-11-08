class Post < ApplicationRecord
    validates :content, presence: true
    has_many :comments, dependent: :destroy

    # belongs_to :parent, class_name: "Post", optional: true
    belongs_to :user
end
