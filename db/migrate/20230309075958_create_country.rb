class CreateCountry < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code, limit: 2
      t.timestamps
    end
  end
end