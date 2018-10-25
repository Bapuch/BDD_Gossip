# This class is linked to the cities table
class City < ApplicationRecord
  has_many :users
end
