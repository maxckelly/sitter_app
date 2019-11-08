class RemoveSexColumnFromSitters < ActiveRecord::Migration[5.2]
  def change
    remove_column :sitters, :sex
  end
end
