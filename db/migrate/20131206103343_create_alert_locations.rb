class CreateAlertLocations < ActiveRecord::Migration
  def change
    create_table :alert_locations do |t|
      t.integer :alert_id
      t.integer :location_id

      t.timestamps
    end
  end
end
