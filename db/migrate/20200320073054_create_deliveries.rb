class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :prefecture_id
      t.string :city
      t.timestamps
    end
  end
end
