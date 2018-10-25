# This class is linked to the gosssip table
class Gosssip < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :likes
end
