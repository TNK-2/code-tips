class AddGiturlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :giturl, :string, default: nil
  end
end
