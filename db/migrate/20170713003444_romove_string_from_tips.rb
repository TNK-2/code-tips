class RomoveStringFromTips < ActiveRecord::Migration[5.0]
  def change
    remove_column :tips, :string, :string
  end
end
