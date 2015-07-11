class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.date :posted_on
      t.integer :sentiment_rank
      t.integer :positive_wc
      t.integer :negative_wc
      t.integer :neutral_wc
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :articles, :user_id
  end
end
