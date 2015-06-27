class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :body
      t.belongs_to :header

      t.timestamps null: false
    end
  end
end
