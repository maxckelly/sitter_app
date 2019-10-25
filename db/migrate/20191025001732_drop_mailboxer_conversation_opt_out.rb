class DropMailboxerConversationOptOut < ActiveRecord::Migration[5.2]
  def change
    drop_table :mailboxer_conversation_opt_outs
  end
end
