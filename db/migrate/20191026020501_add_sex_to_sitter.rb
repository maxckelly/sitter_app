class AddSexToSitter < ActiveRecord::Migration[5.2]
  def change
    add_column :sitters, :sex, :integer
  end
end
