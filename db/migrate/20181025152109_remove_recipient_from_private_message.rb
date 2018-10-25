class RemoveRecipientFromPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :private_messages, :recipient, index: true, foreign_key: true
  end
end
