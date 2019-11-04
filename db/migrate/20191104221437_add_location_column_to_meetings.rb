class AddLocationColumnToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :location, :string
  end
end
