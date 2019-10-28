class RemoveEmailFromSitters < ActiveRecord::Migration[5.2]
  def change
    remove_column :sitters, :email
  end
end
