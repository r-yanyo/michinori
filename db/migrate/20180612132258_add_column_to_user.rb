class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string, limit: 191
    # SQLite3::SQLException: Cannot add a NOT NULL column with default value
    change_column :users, :password_digest, :string, limit: 191, null: false
    add_column :users, :remember_token, :string, limit: 191
  end
end
