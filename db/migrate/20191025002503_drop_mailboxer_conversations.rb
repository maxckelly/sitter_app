class DropMailboxerConversations < ActiveRecord::Migration[5.2]
  def change
    drop_table :mailboxer_conversations
  end
end
