class DropMailboxerNotifications < ActiveRecord::Migration[5.2]
  def change
    drop_table :mailboxer_notifications
  end
end
