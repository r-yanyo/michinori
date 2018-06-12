class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :name, :string, limit: 191, null: false
    change_column :users, :email, :string, limit: 191, null: false
  end
end
