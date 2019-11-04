class AddPaymentToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetings, :payment, foreign_key: true
  end
end
