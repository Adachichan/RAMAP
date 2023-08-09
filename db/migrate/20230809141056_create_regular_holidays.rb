class CreateRegularHolidays < ActiveRecord::Migration[6.1]
  def change
    create_table :regular_holidays do |t|

      t.integer :store_id,   null: false  ## 店舗ID
      t.string :day_of_week, null: false  ## 曜日

      t.timestamps
    end
  end
end
