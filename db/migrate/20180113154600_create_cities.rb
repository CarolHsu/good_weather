class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country
      t.integer :city_id
      t.float :lon
      t.float :lat

      t.timestamps
    end
    add_index :cities, :city_id
  end
end
