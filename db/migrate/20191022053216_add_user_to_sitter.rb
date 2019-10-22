class AddUserToSitter < ActiveRecord::Migration[5.2]
  def change
    add_reference :sitters, :user, foreign_key: true
  end
end
