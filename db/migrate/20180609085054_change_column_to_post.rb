class ChangeColumnToPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :likeNum, :integer, default: 0
  end
end
