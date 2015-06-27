class CreateImgs < ActiveRecord::Migration
  def change
    create_table :imgs do |t|
      t.string :href
      t.string :title
      t.belongs_to :article

      t.timestamps null: false
    end
  end
end
