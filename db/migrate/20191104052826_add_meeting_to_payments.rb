class AddMeetingToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :meeting, foreign_key: true
  end
end
