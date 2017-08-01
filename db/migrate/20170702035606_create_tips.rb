class CreateTips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :title
      t.string :contents
      t.integer :category_id

      t.timestamps
    end
  end
end
