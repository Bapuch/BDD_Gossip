# This class is linked to the private_messages table
class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User", dependent: :destroy
  has_and_belongs_to_many :recs, class_name: "User", dependent: :destroy
end
