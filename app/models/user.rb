# This class is linked to the users table
class User < ApplicationRecord
  belongs_to :city
  has_many :gosssips
  has_and_belongs_to_many :received_messages, foreign_key: "rec_id", association_foreign_key: "received_message_id", class_name: "PrivateMessage", optional: true
  has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_many :comments
  has_many :likes
end
