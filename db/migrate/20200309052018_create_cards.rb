class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|

      t.timestamps
    end
  end
end
