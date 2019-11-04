class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :start_date, :start_time
  end
end
