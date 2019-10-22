class AddUserToParent < ActiveRecord::Migration[5.2]
  def change
    add_reference :parents, :user, foreign_key: true
  end
end
