class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null:false
      t.string :prefectures, null: false
      t.string :municipalities, null: false
      t.string :house_number, null: false
      t.string :room_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
