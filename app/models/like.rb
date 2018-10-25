# This class is linked to the likes table
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gosssip, optional: true
  belongs_to :comment, optional: true
end
