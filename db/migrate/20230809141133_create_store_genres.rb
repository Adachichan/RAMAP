class CreateStoreGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :store_genres do |t|

      t.integer :store_id, null: false               ## 店舗ID
      t.string :name,      null: false, default: ""  ## ジャンル名

      t.timestamps
    end
  end
end
