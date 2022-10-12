class Post < ApplicationRecord
    has_many :replies, class_name: "Post", foreign_key: "parent_id"

    belongs_to :parent, class_name: "Post", optional: true
end
