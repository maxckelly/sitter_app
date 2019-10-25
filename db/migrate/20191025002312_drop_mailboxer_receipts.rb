class DropMailboxerReceipts < ActiveRecord::Migration[5.2]
  def change
    drop_table :mailboxer_receipts
  end
end
