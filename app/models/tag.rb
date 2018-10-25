# This class is linked to the tags table
class Tag < ApplicationRecord
  has_and_belongs_to_many :gosssips
end
