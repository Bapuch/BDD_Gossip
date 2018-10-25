class CreateJoinTableGosssipTag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :gosssips, :tags do |t|
      t.index [:gosssip_id, :tag_id]
      t.index [:tag_id, :gosssip_id]
    end
  end
end
