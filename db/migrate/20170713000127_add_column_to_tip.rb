class AddColumnToTip < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :user_id, :string
    add_column :tips, :string, :string
  end
end
