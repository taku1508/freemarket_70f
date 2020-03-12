class AddBirthdayYearToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday_year, :integer, null: false
    add_column :users, :birthday_month, :integer, null: false
    add_column :users, :birthday_day, :integer, null: false
  end
end
