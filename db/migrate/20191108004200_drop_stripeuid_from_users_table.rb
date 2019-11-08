class DropStripeuidFromUsersTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :stripe_uid
  end
end
