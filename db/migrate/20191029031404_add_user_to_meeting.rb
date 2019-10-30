class AddUserToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetings, :parent_user, foreign_key: { to_table: 'users' }
    add_reference :meetings, :sitter_user, foreign_key: { to_table: 'users' }
  end
end
