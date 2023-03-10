class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.date :dob
      t.string :email
      t.string :phone_number
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
