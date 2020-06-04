class Ride < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      

      t.timestamp
    end
  end
end
