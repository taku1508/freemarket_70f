class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :number, null: false
      t.integer :limit, null: false
      t.integer :cord, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
