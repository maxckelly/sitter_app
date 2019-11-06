class ChangePriceToBeIntegerInPayments < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :price, :integer
  end
end
