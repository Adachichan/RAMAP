class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id,  null: false               ## 会員ID
      t.integer :store_id, null: false               ## 店舗ID
      t.date :visit_date,  null: false               ## 訪問日
      t.string :title,     null: false, default: ""  ## タイトル
      t.text :content,     null: false, default: ""  ## 内容
      t.integer :score,    null: false, default: 60  ## 口コミ評価（点数）
      t.timestamps
    end
  end
end
