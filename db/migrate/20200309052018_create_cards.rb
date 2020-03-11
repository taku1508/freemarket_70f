class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user ,foreign_key: true, null: false
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.timestamps
    end
  end
end
