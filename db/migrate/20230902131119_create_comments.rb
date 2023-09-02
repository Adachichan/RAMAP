class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :review_id, null: false               ## 口コミID
      t.string :poster,     null: false               ## コメント投稿者
      t.string :store,      null: false               ## コメント対象店舗
      t.text :content,      null: false, dafault: ""  ## コメント内容
      t.timestamps
    end
  end
end
