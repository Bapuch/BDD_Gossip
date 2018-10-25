class CreateJoinTableToPrivateMessageUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :private_messages, :users do |t|
      t.integer "private_message_id", null: true
      t.integer "user_id", null: true
      t.integer "rec_id", null: true
      t.integer "received_message_id", null: true
      t.index [:received_message_id, :rec_id]
      t.index [:rec_id, :received_message_id]
    end
  end
end
