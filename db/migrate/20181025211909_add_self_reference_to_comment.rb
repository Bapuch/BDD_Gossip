class AddSelfReferenceToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :related_comment
  end
end
