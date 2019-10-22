class CreateSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :sitters do |t|
      t.string :name
      t.text :description
      t.text :email
      t.date :age
      t.text :location

      t.timestamps
    end
  end
end
