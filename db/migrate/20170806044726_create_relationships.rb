class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :favourite_tip_id
      t.integer :favouritter_id

      t.timestamps
    end
    add_index :relationships, :favourite_tip_id
    add_index :relationships, :favouritter_id
    add_index :relationships, [:favourite_tip_id, :favouritter_id], unique: true
  end
end
