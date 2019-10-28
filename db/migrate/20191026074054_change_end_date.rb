class ChangeEndDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :end_date, :end_time
  end
end
