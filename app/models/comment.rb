# This class is linked to the comments table
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gosssip
  has_many :likes
  has_many :sub_comments, class_name: "Comment", foreign_key: "related_comment_id"
  belongs_to :related_comment, class_name: "Comment", optional: true
end
