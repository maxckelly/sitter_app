class AddFieldsToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :latitude, :float
    add_column :meetings, :longitude, :float
  end
end
