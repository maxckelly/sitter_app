class ChangeColumnLocationInMeetings < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :location, :address
  end
end
