class ChangeColumnToPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :likeNum, :integer, default: 0
    change_column :posts, :author, :string, default: "名無しさん"
    change_column :posts, :user_id, :integer, default: nil
  end
end
