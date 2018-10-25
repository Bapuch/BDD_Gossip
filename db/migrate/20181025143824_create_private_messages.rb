class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.references :recipient, index: true, foreign_key: true
      t.references :sender, index: true, foreign_key: true
      t.timestamps
    end
  end
end
