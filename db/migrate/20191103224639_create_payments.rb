class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.boolean :paid
      t.decimal :price

      t.timestamps
    end
  end
end
