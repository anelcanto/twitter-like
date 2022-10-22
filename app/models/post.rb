class Post < ApplicationRecord
    validates :content, presence: true
    has_many :replies, class_name: "Post", foreign_key: "parent_id"
    has_many :comments, dependent: :destroy

    belongs_to :parent, class_name: "Post", optional: true
end
