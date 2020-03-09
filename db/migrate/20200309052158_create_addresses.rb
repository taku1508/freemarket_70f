class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_name, null: false
      t.string :address_hurigana, null: false
      t.integer :postal_code, null:false
      t.string :prefectures, null: false
      t.string :municipalities, null: false
      t.string :house_number, null: false
      t.string :room_number
      t.timestamps
    end
  end
end
